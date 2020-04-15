import React from 'react';
import ReactDOM from 'react-dom';

class Clock extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            date: new Date()
        };
        this.tick = this.tick.bind(this)
    };

    componentDidMount(){
        this.tickId = setInterval(this.tick, 1000)
    }

    componentWillUnmount(){
        clearInterval(this.tickId)
    }

    tick(){
        this.setState({date: new Date() });
    }

    render(){

        return(
            <div>
                <h1>Clock</h1>
                <div id="clock">
                <p>
                    <span>
                        Time
                    </span>
                    <span>
                        {this.state.date.getHours()}:{this.state.date.getMinutes()}:{this.state.date.getSeconds()}
                    </span>
                </p>
                
                <p>
                    <span>
                        Date
                    </span>
                    <span>
                        {this.state.date.toDateString()}
                    </span>
                </p>
                </div>
            </div>
        )
    }
}



export default Clock;