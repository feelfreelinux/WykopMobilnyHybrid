import { connect } from 'react-redux'
import { RootState } from '../reducers'
import Mikroblog from '../components/Mikroblog'
import { loadHotEntriesAction, loadActiveEntries, loadStreamEntries } from '../actions/mikroblogActions'
import { ThunkDispatch } from 'redux-thunk';
import { RootActions } from '../actions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryIds: state.mikroblog.entryIds,
  entries: state.entity.entities.entries,
  loading: state.mikroblog.loading,
  refreshing: state.mikroblog.refreshing,
})

const mapDispatchToProps = (dispatch: ThunkDispatch<RootState, undefined, RootActions>) => ({
  getHotEntries: (period, refresh) => dispatch(loadHotEntriesAction(period, refresh)),
  getActiveEntries: (refresh) => dispatch(loadActiveEntries(refresh)),
  getNewestEntries: (refresh) => dispatch(loadStreamEntries(refresh)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Mikroblog)