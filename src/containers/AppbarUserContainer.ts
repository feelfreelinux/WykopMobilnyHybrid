import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import { AuthActions } from '../actions/authActions';
import AppbarUser from '../components/AppbarUser'

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  avatarUrl: state.auth.avatarUrl,
})

const mapDispatchToProps = (dispatch: Dispatch<AuthActions>) => ({
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(AppbarUser)