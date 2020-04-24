import React from 'react'
import { Link } from 'react-router-dom'

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }

    handleChange(field) {
        return (e) => {
            this.setState({[field]: e.target.value})
        }
    }

    render(){
        // debugger
        return(
            <div>
                <h1>{(this.props.formType === "signup") ? "Sign Up!" : "Log in!" }</h1>
                <Link to={(this.props.formType === "signup") ? "/login" : "/signup"}>{(this.props.formType === "signup") ? "Log In" : "Sign Up"}</Link>
                <br/>
                <br/>
                <ul>
                    {this.props.errors.map(error => <li>{error}</li>)}
                </ul>
                
                <br/>
                
                <form onSubmit={this.handleSubmit}>
                    <label>
                        Username:
                        <input onChange= {this.handleChange("username")} type="text" value={this.state.username}/>
                    </label>
                    <br/>
                    <label>
                        Password:
                        <input onChange={this.handleChange("password")} type="password" value={this.state.password} />
                    </label>
                    <br/>
                    <button>Submit</button>
                </form>
            </div>

        )
    }
}

export default SessionForm;