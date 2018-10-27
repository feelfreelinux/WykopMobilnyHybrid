import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import Mikroblog from '../components/Mikroblog'
import { getHotEntries, GetHotEntries, SetEntries, MikroblogActions } from '../actions/mikroblogActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryIds: state.mikroblog.entryIds,
  entries: state.entity.entities.entries,
  refreshing: state.mikroblog.refreshing,
})

const mapDispatchToProps = (dispatch: Dispatch<MikroblogActions>) => ({
  getHotEntries: (period) => dispatch(getHotEntries(period)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Mikroblog)