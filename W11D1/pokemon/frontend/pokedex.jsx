import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'


//Testing
import {fetchAllPokemon} from './util/api_util';
import {requestAllPokemon} from './actions/pokemon_actions';
import {selectAllPokemon} from './reducers/selectors'
window.selectAllPokemon = selectAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.requestAllPokemon = requestAllPokemon;

document.addEventListener("DOMContentLoaded", () => {
    let store = configureStore();
    window.getState = store.getState; 
    window.dispatch = store.dispatch;
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
})