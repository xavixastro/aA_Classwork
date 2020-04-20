import * as TodoAPIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos //array of todos
})

export const receiveTodo = (todo) => ( {
    type: RECEIVE_TODO, 
    todo //todo object
} )

export const fetchTodos = () => (dispatch) => (
    TodoAPIUtil.fetchTodos()
    .then(todos => dispatch(receiveTodos(todos)))
)


window.fetchTodos = fetchTodos;