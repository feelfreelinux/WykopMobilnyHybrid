import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import Mikroblog from '../components/Mikroblog'
import { getHotEntries, GetHotEntries, SetEntries, MikroblogActions } from '../actions/mikroblogActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entries: state.mikroblog.entries
})

const mapDispatchToProps = (dispatch: Dispatch<MikroblogActions>) => ({
  getHotEntries: (page: number) => dispatch(getHotEntries()),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Mikroblog)