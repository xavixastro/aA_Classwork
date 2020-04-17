export const allTodos = (state) => {
    // let keys = Object.keys(state.todos);
    // let todos = keys.map(id => {
    //     return state.todos[id];
    // })
    // return todos;
    return Object.values(state.todos)
}

window.allTodos = allTodos;