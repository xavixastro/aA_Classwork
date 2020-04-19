import React from "react" 

class Autocomplete extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            inputVal: ""
        }
        this.updateInput = this.updateInput.bind(this)
    }

    updateInput(e){
        this.setState({inputVal: e.target.value})
    }

    render(){
        return (
            <div className="autocomplete">
                <input onChange={this.updateInput} type="text"/>
                <ul>
                    {this.props.names.filter(name => name.toLowerCase().startsWith(this.state.inputVal.toLowerCase())).map( name => <li>{name}</li>)}
                </ul>
            </div>
        )
    }

}

export default Autocomplete;