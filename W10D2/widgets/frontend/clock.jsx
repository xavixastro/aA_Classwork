import React from 'react'

class Clock extends React.Component {

    constructor(){
        super();
        this.state = {
            date: new Date()
        }
        this.tick = this.tick.bind(this);
    }

    componentDidMount(){
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        clearInterval(this.interval);
    }

    tick(){
        let date = new Date();
        this.setState({ date: new Date() })
    }

    render(){
        return (
        <div className="clock">
            <p>
                <span>Time:</span>
                <span>{`${this.state.date.getHours()}:${this.state.date.getMinutes()}:${this.state.date.getSeconds()}`}</span>
            </p>
            <p>
                <span>Date:</span>
                <span>{this.state.date.toDateString()}</span>
            </p>
        </div>
        )
    }

}

export default Clock;