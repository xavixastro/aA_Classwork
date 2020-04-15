import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock'
import Tabs from './tabs'
// make the array, fill it with objects hashes and each of these has a title and content as keys.
// tabs
// <Tabs tabs={tab}/>
const tabs = [
    {title: 'one',content:'Ruby on Rails'},
    {title: 'two',content:'SQL'},
    {title: 'three',content:'Javascript'},
    {title: 'four',content:'React'}
]
// make function called Root that returns the instance of clock and tab.
function Root(){
    return(
        <div>
            <Clock/>
            <Tabs tabs={tabs}/>
        </div>
    )
}
document.addEventListener("DOMContentLoaded", ()=>{
    const root = document.getElementById("root");
    ReactDOM.render(<Root/>, root)
})