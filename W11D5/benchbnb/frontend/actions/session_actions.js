import * as APIUtil from '../util/session_api_util'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS'

//regular action creators

const receiveCurrentUser = (currentUser) => (
    {
        type: RECEIVE_CURRENT_USER, 
        currentUser // username & id
    }
)

const logoutCurrentUser = () => (
    {
        type: LOGOUT_CURRENT_USER,
    }
)

const receiveErrors = (errors) => {
    // debugger
    return(
    {
        type: RECEIVE_SESSION_ERRORS, 
        errors
    }
)}

//thunk action crrators

export const login = (user) => dispatch => {
    return APIUtil.login(user)
    .then (user => dispatch(receiveCurrentUser(user)),
        err => dispatch(receiveErrors(err.responseJSON)))
}

export const signup = (user) => dispatch => {
    return APIUtil.signup(user)
    .then (user => dispatch(receiveCurrentUser(user)),
        err => dispatch(receiveErrors(err.responseJSON)))
}

export const logout = () => dispatch => {
    return APIUtil.logout()
    .then (() => dispatch(logoutCurrentUser()), 
        err => dispatch(receiveErrors(err.responseJSON)))
}