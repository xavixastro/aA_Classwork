export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON_DETAIL = 'RECEIVE_POKEMON_DETAIL';
import * as APIUtil from '../util/api_util';

export const receiveAllPokemon = (pokemon) => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
})

export const receivePokemonDetail = (payload) => ({
    type: RECEIVE_POKEMON_DETAIL,
    payload
})

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestPokemonDetail = (pokeId) => (dispatch) => ( //requestSinglePokemon
    APIUtil.fetchPokemon(pokeId)
    .then(payload => dispatch(receivePokemonDetail(payload)))
)