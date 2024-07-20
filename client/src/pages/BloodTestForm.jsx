import React,{useState} from 'react' 
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import {useRef} from 'react';
import { FaAngleDown } from 'react-icons/fa';
import app from "../context/axiosConfig";
import { Navigate, useLocation, useNavigate } from "react-router-dom";
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';


// const data = [{id: 499, label: "Basic Pack (Rs 499)", sublabel:"Contains 11 tests"}, {id: 599, label: "Premium Pack (Rs 599)", sublabel:"Contains 15 tests"}, {id: 899, label: "Gold Pack (Rs 899)", sublabel:"Contains 21 tests"}, {id:1199, label: "Platinum Pack (Rs 1199)", sublabel:"Contains 30 tests"}];


const BloodTestForm=()=>{ 
	  const [Name,setName]=useState(""); 
	  const [Sem,setSem]=useState(""); 
    const [USN,setUSN]=useState(""); 
    const [complaint,setcomplaint]=useState(""); 
    const ref = useRef(null);

	const navigate = useNavigate();

  const [isOpen, setOpen] = useState(false);
  // const [items, setItem] = useState(data);
  const [selectedItem, setSelectedItem] = useState(null);
  
  const toggleDropdown = () => setOpen(!isOpen);
  const [show, setShow] = useState(false);

  const handleClose = () => navigate("/");
  const handleShow = () => setShow(true);
  
  // const handleItemClick = (id) => {
  //   selectedItem === id ? setSelectedItem(null) : setSelectedItem(id);
	// console.log(id)
  // }
	
	const handleTestSubmit=async(e)=>{
      e.preventDefault()

	  try {
		  await app.post(`/posts/bloodtests`, {
			  Name,
			  Sem,
			  USN,
			  complaint
			  // selectedItem			  
			});
		setShow(true);
	  } catch (err) {
		console.log(err);
	  }    
	}

    const handleTextarea = event => {
        
        setcomplaint(event.target.value);
        // console.log(event.target.value);
      };
	return(
	<div className='form'>
		<Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Success!</Modal.Title>
        </Modal.Header>
        <Modal.Body>complaint has been filed successfully</Modal.Body>
        <Modal.Footer>
          
          <Button variant="success" onClick={handleClose}>
            Go to Home
          </Button>
        </Modal.Footer>
      </Modal>
		<form > 
			<div > 
				<label htmlFor="Name">Name:</label>
				<input type="text" name="Name" id="Name" value={Name} onChange={(e)=>setName(e.target.value)}/> 
			</div> 
			<div > 
				<label htmlFor="Sem">Sem:</label>
			<input type="text" name="Sem" id="Sem" value={Sem} onChange={(e)=>setSem(e.target.value)}/> 
			</div>  
            <div > 
				<label htmlFor="USN">USN:</label>
			<input type="text" name="USN" id="USN" value={USN} onChange={(e)=>setUSN(e.target.value)}/> 
			</div>  
            <div className='addressfield'> 
				<label htmlFor="complaint">Complain: </label>
                <textarea  className='area' name="complaint" id="complaint" value={complaint}
    onChange={handleTextarea}/>
	
	{/* <div className='dropdown-header' onClick={toggleDropdown}>
        {selectedItem ? items.find(item => item.id == selectedItem).label : "Select your package"}
		<FaAngleDown/>
      </div>
      <div className={`dropdown-body ${isOpen && 'open'}`}>
        {items.map(item => (
          <div className="dropdown-item" onClick={e => handleItemClick(e.target.id)} id={item.id} key={item.id}>
            <span className={`dropdown-item-dot ${item.id === selectedItem && 'selected'}`}>• </span>
            {item.label}
            <br/>
            {item.sublabel}
          </div>
        ))}
      </div> */}
                
      {/* <TextareaAutosize className='area'
    minRows={3}
    maxRows={6}
    value={Address}
    onChange={(e)=> setAddress(e.target.value)}
    /> */}
			</div>  
            
             
			<button className='greenbtn' type="submit" onClick={handleTestSubmit}>Confirm your Complain</button>
		</form>

		
	</div>
)} 

export default BloodTestForm;