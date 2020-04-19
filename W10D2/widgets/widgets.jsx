import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Autocomplete from './frontend/autocomplete';

const tabs = [{title: "Mike", content: "San Francisco pug"}, {title: "Tom", content: "Oakland pug"}, {title:"Rocky", content: "Costa Rica pug"}]
const names = ['Ally', 'Allison', 'Daniel', 'David', 'Donald', 'Jason', 'Javier', 'Marco', 'Wendy']

const Root = () => {
    return (
    <>
        <Clock/>
        <Tabs tabs={tabs}/>
        <Autocomplete names={names}/>
    </>
    )
}

document.addEventListener("DOMContentLoaded", () => {
    let root = document.getElementById("hook");
    ReactDOM.render(<Root/>, root);
})