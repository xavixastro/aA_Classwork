import {RECEIVE_POKEMON_DETAIL} from '../actions/pokemon_actions';

const itemsReducer = (state={}, action) => {
    Object.freeze(state);
    let nextState = {};
    switch (action.type) {
        case RECEIVE_POKEMON_DETAIL:
            return Object.assign(nextState, action.payload.items)
        default:
            return state;
    }
}

export default itemsReducer;