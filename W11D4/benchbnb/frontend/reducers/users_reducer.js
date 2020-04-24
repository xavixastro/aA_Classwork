import {RECEIVE_CURRENT_USER} from '../actions/session_actions'

const usersReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            nextState[action.currentUser.id] = action.currentUser;
            return nextState;
        default:
            return state;
    }
}

export default usersReducer


// {
//     entities: {
//         users: { }
//     },
//     session: {
//         id: null,
//   },
//     errors: {
//         session: ["Invalid credentials"]
//     }
// }


// or this:

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