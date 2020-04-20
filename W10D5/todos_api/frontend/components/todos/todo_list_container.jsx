import {connect} from 'react-redux';
import TodoList from './todo_list';
import {allTodos} from '../../reducers/selectors'
import {receiveTodo, fetchTodos } from '../../actions/todo_actions';



const mapStateToProps = (state) => ({
    todos: allTodos(state)
})


const mapDispatchToProps = (dispatch) => ({
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos())
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
