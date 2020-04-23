import { connect } from 'react-redux';
import { login } from '../../actions/session';
import SignIn from './signin';

const mapDispatchToProps = dispatch => ({
    login: formUser => dispatch(login(formUser)),
})

export default connect(null, mapDispatchToProps)(SignIn)