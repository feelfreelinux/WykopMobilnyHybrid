import { connect } from 'react-redux'
import { RootState } from '../reducers'
import Mikroblog from '../components/Mikroblog'
import { loadHotEntriesAction } from '../actions/mikroblogActions'
import { ThunkDispatch } from 'redux-thunk';
import { RootActions } from '../actions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryIds: state.mikroblog.entryIds,
  entries: state.entity.entities.entries,
  refreshing: (state.mikroblog as any).refreshing,
})

const mapDispatchToProps = (dispatch: ThunkDispatch<RootState, undefined, RootActions>) => ({
  getHotEntries: (period) => dispatch(loadHotEntriesAction(period)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Mikroblog)