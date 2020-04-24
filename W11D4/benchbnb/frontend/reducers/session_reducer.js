import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from '../actions/session_actions'

const sessionReducer = (state = {id: null}, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return {id: action.currentUser.id}
        case LOGOUT_CURRENT_USER:
            return {id: null}
        default:
            return state;
    }
}

export default sessionReducer



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
