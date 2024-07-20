import React from "react";
import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
import { useState } from "react";
import app from "../context/axiosConfig";
import { Navigate, useLocation, useNavigate } from "react-router-dom";
import moment from "moment";
import { AuthContext } from "../context/authContext";
import { useContext } from "react";

const Write = () => {
  const state = useLocation().state;
  const [value, setValue] = useState(state?.desc || "");
  const [title, setTitle] = useState(state?.title || "");
  const [cat, setCat] = useState(state?.cat || "");
  const [file, setFile] = useState(null);

  const navigate = useNavigate();

  const {admin} = useContext(AuthContext);

  const upload = async () => {
    try {
      const formData = new FormData();
      formData.append("file", file);
      const res = await app.post("/upload", formData);
      return res.data;
    } catch (err) {
      console.log(err);
    }
  };

  const handleAdmin = async() => {
    const ImgUrl = await upload();
    if(state){
      const res = await app.put(`/posts/verify/${state.id}`, {
        title,
        desc: value,
        cat,
        img: file ? ImgUrl : "",
      });
      const res2 =  await app.put(`/posts/${state.id}`, {
        title,
        desc: value,
        cat,
        img: file ? ImgUrl : "",
      })
    }
    
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    const ImgUrl = await upload();

    if(admin!=null){
      try {
        state
          ? handleAdmin()
          : await app.post(`/posts`, {
              title,
              desc: value,
              cat,
              img: file ? ImgUrl : "",
              date: moment(Date.now()).format("YYYY-MM-DD HH:mm:ss"),
            });
        navigate("/");
      } catch (err) {
        console.log(err);
      }
    }
    else{
      try {
        state
          ? await app.put(`/posts/${state.id}`, {
              title,
              desc: value,
              cat,
              img: file ? ImgUrl : "",
            })
          : await app.post(`/posts`, {
              title,
              desc: value,
              cat,
              img: file ? ImgUrl : "",
              date: moment(Date.now()).format("YYYY-MM-DD HH:mm:ss"),
            });
        navigate("/");
      } catch (err) {
        console.log(err);
      }
    }
    
  };
  return (
    <div className="add">
      <div className="content">
        <input
          type="text"
          value={title}
          placeholder="title"
          onChange={(e) => setTitle(e.target.value)}
        />
        <div className="editorContainer">
          <ReactQuill
            className="editor"
            theme="snow"
            value={value}
            onChange={setValue}
          />
        </div>
      </div>
      <div className="menu">
        <div className="item">
          <h1>Publish</h1>
          
          <span>
            <b>Visibility:</b> Public
          </span>
          <input
            type="file"
            id="file"
            name=""
            onChange={(e) => setFile(e.target.files[0])}
          />
          <label htmlFor="file">Upload Image</label>
          <div className="buttons">
            {/* <button>Save as a draft</button> */}
            <button onClick={handleSubmit}>Publish</button>
          </div>
        </div>
        <div className="item">
          <h1>Category</h1>
          <div className="cat">
            <input
              type="radio"
              name="cat"
              value="academics"
              id="academics"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="academics">academics</label>
          </div>

          <div className="cat">
            <input
              type="radio"
              name="cat"
              value="events"
              id="events"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="events">events</label>
          </div>

          <div className="cat">
            <input
              type="radio"
              name="cat"
              value="uni-news"
              id="uni-news"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="uni-news">data-s</label>
          </div>

          <div className="cat">
            <input
              type="radio"
              name="cat"
              value="clubs"
              id="clubs"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="clubs">fullstack</label>
          </div>

          <div className="cat">
            <input
              type="radio"
              name="cat"
              value="RnD"
              id="RnD"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="RnD">ML</label>
          </div>

          <div className="cat">
            <input
              type="radio"
              name="cat"
              value="other"
              id="other"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="other">other</label>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Write;
