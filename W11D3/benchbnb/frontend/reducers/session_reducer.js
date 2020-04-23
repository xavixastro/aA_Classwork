import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER} from '../actions/session_action';

const _nullSession = {
    id: null
}

const sessionReducer = (state = _nullSession, action) => {
    Object.freeze(state);
    // let nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            nextState = {id: action.user.id };
            return nextState;
        case LOGOUT_CURRENT_USER:
            return _nullSession;
        default:
            return state;
    }
}

export default sessionReducer;
// {
//     entities: {
//         users: {
//             1: {
//                 id: 1,
//                     username: 'breakfast'
//             }
//         }
//     },
//     session: {
//         id: 1
//     },
//     errors: {
//         session: []
//     }
// }