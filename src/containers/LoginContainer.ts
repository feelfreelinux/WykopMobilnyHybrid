import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { ThunkDispatch } from 'redux-thunk';
import { RootActions } from '../actions'
import HomeComponent from '../components/Home';
import { restoreAuthState, loginUser } from '../actions/authActions';
import LoginComponent from '../components/Login';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  isLoggedIn: state.auth.loggedIn,
})

const mapDispatchToProps = (dispatch: ThunkDispatch<RootState, undefined, RootActions>) => ({
    loginUser: (login, token) => dispatch(loginUser(login, token)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(LoginComponent)