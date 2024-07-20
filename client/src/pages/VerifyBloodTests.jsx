import React from 'react'
import { AuthContext } from '../context/authContext';
import { useEffect } from "react";
import { useState,useContext } from "react";
import { Link, Navigate, useLocation, useNavigate } from "react-router-dom";
import app from '../context/axiosConfig';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';

const VerifyBloodTests = () => {
    const navigate = useNavigate();
    const [data, setData] = useState([]);
    const {admin} =  useContext(AuthContext)
    const [show, setShow] = useState(false);
    

    useEffect(() => {
      const fetchData = async () => {
        if(admin!=null){
          try {
            const res = await app.get(`/posts/bloodtests/get`);
            setData(res.data);
            console.log(res)
          } catch (err) {
            console.log(err);
          }
        }
    }
    
        fetchData();
      }, []);


      // const verifyTest = async(e)=>{
      //     e.preventDefault();
      //     try{
      //       await app.put(`/bloodtests${tests.id}`)
      //       console.log('success')
      //     }
      //     catch(err){
      //       console.log(err)
      //     }
      //   setShow(true)
          
      //   }
      
        

  const handleClose = () => setShow(false);
  const handleHome = () => navigate("/")


  return (
    <div className='verifytests'>
      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Success!</Modal.Title>
        </Modal.Header>
        <Modal.Body>complaint verified successfully</Modal.Body>
        <Modal.Footer>
          
          <Button variant="success" onClick={handleHome}>
            Go to Home
          </Button>
        </Modal.Footer>
      </Modal>
      {admin!=null&&
      <div className="admin">
      <h3>Pending complaints
      </h3>
      
      </div>}
     
      <div className="testcards">
      {[...data].reverse().map((tests)=>(
          <div className="tests" key={tests.id}>
            <div className="testcontent">
            <h1>{tests.name}</h1>
            <h6>Sem: {tests.sem}</h6>
            <h6>USN: {tests.Usn}</h6>
            <h6>Complaint: {tests.complaint}</h6>
            
            </div>
            <div className="btn">
            <button className='greenbtn' onClick={async(e)=>{
          e.preventDefault();
          try{
            await app.put(`/posts/bloodtests/${tests.id}`)
            console.log('success')
          }
          catch(err){
            console.log(err)
          }
        setShow(true)
          }}>Verify</button>
            </div>
            
          </div>
          
        ))}
        
      </div> 


      
    </div>
    
  )
}

export default VerifyBloodTests