import React from 'react';
import { useContext } from 'react';
import {Link} from 'react-router-dom';

import { AuthContext } from '../context/authContext';
import Logo from '../img/logo.png';



const Navbar = () => {

    const{currentUser,logout,admin} = useContext(AuthContext)
   
  return (
    <div className='navbar'>
        <div className="container">
            <div className="logo">
                <Link to='/'>
                <img src={Logo} alt="" /></Link>
                
            </div>
            <div className="links">
                <Link className='link' to="/?cat=academics">
                    <h6>gen-ai&nbsp;</h6>
                </Link>
               
                <Link className='link' to="/?cat=events">
                    <h6>geo-polictics&nbsp;</h6>
                </Link>
                <Link className='link' to="/?cat=Uni-NEWS">
                    <h6>datas-cience&nbsp;</h6>
                </Link>
                <Link className='link' to="/?cat=clubs">
                    <h6>fullstack&nbsp;</h6>
                </Link>
                <Link className='link' to="/?cat=RnD">
                    <h6>ML&nbsp;</h6>
                </Link>
                <Link className='link' to="/?cat=other">
                    <h6>Math&nbsp;</h6>
                </Link>
                {/* {(currentUser||admin) && <img className='person' src="https://img.freepik.com/free-icon/important-person_318-10744.jpg?w=2000" alt="" />} */}
                <span className='personName'>
                    
                    {(currentUser||admin)?.username}</span>
                {(currentUser||admin)? <Link className='logout' to="/login" onClick={logout}>Logout</Link>: <Link className='link' to="/login">Login</Link>}
                {(currentUser||admin)&& <span className='write'>
                    <Link className='link' to='/write'>Share</Link>
                </span>}

                {/* {admin && <img className='person' src="https://img.freepik.com/free-icon/important-person_318-10744.jpg?w=2000" alt="" />}
                <span className='personName'>
                    
                    {admin?.username}</span>
                {admin && <Link className='logout' to="/login" onClick={logout}>Logout</Link>}
                {admin&& <span className='write'>
                    <Link className='link' to='/write'>Write</Link>
                </span>} */}
            </div>
        </div>
    </div>
  )
}

export default Navbar