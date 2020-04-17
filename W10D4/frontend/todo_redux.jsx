import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import App from './components/app'
import Root from './components/root'
import allTodos from './reducers/selectors'

const store = configureStore();
window.store = store;

document.addEventListener("DOMContentLoaded", () => {
    let root = document.getElementById("content");
    ReactDOM.render(
        <Root store={store}/>,
    root
    )

})