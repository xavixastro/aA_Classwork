import React from 'react';
import { Link } from 'react-router-dom'

class Greeting extends React.Component {

    constructor(props){
        super(props);
        this.logout = this.logout.bind(this)
    }

    logout(){
        this.props.logout();
    }

    render(){
        if (this.props.currentUser === undefined) {
            return (
                <div>
                    <Link to="/signup">Sign Up</Link>
                    <br/>
                    <Link to="/login">Log In</Link>
                </div>
            )
        } else {
            return (
                <div>
                    <h3>Welcome {this.props.currentUser.username}</h3>
                    <button onClick={this.logout}>Log Out</button>
                </div>
            )
        }
    }
}

export default Greeting;