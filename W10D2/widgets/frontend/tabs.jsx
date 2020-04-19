import React from 'react'

class Tabs extends React.Component{

    constructor(props){
        super(props);
        this.state = {
            index: 0
        }
        this.updateIndex = this.updateIndex.bind(this)
    }

    updateIndex(index){
        return () => this.setState({index})
    }

    render(){
        return (
            <div className="tabs">
                <ul>
                    {this.props.tabs.map((tab, idx) => <h1 id={this.state.index === idx ? "selected" : "" } onClick={this.updateIndex(idx)}>{tab.title}</h1>)}
                </ul>
                <article>
                    {this.props.tabs[this.state.index].content}
                </article>
            </div>
        )
    }
}

export default Tabs;