export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos //array
})

export const receiveTodo = (todo) => ({
    type: RECEIVE_TODO,
    todo  //object
})

window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;