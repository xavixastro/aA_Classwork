import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';


class TodoList extends React.Component {

    constructor (props) {
        super(props)
    }

    componentDidMount(){
        // debugger
        this.props.fetchTodos();
    }

    render(){
        return (
            <div>
                <ul>
                    {this.props.todos.map((todo,idx) => <TodoListItem key={idx} todo={todo}/> )}
                </ul>
                <TodoForm receiveTodo={this.props.receiveTodo}/>
            </div>
        )
    }
}

export default TodoList;
