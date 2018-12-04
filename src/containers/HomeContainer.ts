import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { ThunkDispatch } from 'redux-thunk';
import { RootActions } from '../actions'
import HomeComponent from '../components/Home';
import { restoreAuthState } from '../actions/authActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  avatarUrl: state.auth.avatarUrl,
})

const mapDispatchToProps = (dispatch: ThunkDispatch<RootState, undefined, RootActions>) => ({
    restoreAuthState: () => dispatch(restoreAuthState()),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HomeComponent)