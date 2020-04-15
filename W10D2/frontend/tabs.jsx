import React from 'react'

const Headers = props => {
    return (
        
        // <li>{
        //     console.log(props),
        //     console.log(this)
        //     }
        // </li>
        // put event listener here for click
        // on click we invoke that passed callback that we got
        <li onClick={()=>props.chooseTab(props.index)}>
            {props.title}
        </li>
    )
}


export default class Tabs extends React.Component {

    // do we add the index to the tabs object here?
    constructor(props) {
        super(props);
        this.state = {
            id: 0
        }
        this.chooseTab = this.chooseTab.bind(this)
    }
    // create function
    chooseTab(num){
        this.setState({id: num})
    }
    // make change tab callback and pass to header as prop
    render(){
        return(
            <div>
                <ul>
                    {this.props.tabs.map ((tab, idx) => {
                        return (<Headers chooseTab = {this.chooseTab} title= {tab.title} index= {idx} key= {idx}/> )
                    })}
                </ul>
                <div>
                    {this.props.tabs[this.state.id].content}
                </div>
            </div>
        )
    }
}
