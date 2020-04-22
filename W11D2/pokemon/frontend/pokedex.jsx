import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { HashRouter, Route } from "react-router-dom";


//Testing
import { fetchPokemon, fetchAllPokemon } from './util/api_util';
import {requestPokemonDetail,requestAllPokemon} from './actions/pokemon_actions';
// import {selectAllPokemon} from './reducers/selectors'
// window.selectAllPokemon = selectAllPokemon;
// window.fetchAllPokemon = fetchAllPokemon;
// window.requestAllPokemon = requestAllPokemon;
window.fetchPokemon = fetchPokemon;
window.requestPokemonDetail = requestPokemonDetail;

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    window.getState = store.getState; 
    window.dispatch = store.dispatch;
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
})