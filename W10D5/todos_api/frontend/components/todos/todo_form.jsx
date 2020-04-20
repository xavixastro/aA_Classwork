import React from 'react';

class TodoForm extends React.Component {

    constructor (props) {
        super(props)
        this.state = {
            title: "",
            body: ""
        }
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.submitForm = this.submitForm.bind(this);
    }

    updateTitle(e){
        this.setState({title: e.target.value})
    }

    updateBody(e) {
        this.setState({ body: e.target.value })
    }

    uniqueId() {
        return new Date().getTime();
    }

    submitForm(e){
        event.preventDefault();
        this.props.receiveTodo({id: this.uniqueId(), title: this.state.title, body: this.state.body, done: false})
        this.state.title = "";
        this.state.body = "";
    }


    render() {
        return (
            <form>
                <label>
                    Title:
                    <input onChange={this.updateTitle} type="text" value={this.state.title}/>
                </label>
                <label>
                    Body:
                    <input onChange={this.updateBody} type="text" value={this.state.body}/>
                </label>
                <button onClick={this.submitForm}>Submit</button>
            </form>
        )
    }


}


export default TodoForm;