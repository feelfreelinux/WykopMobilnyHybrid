import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import EntryComponent from '../components/Entry'
import { getHotEntries, GetHotEntries, SetEntries, MikroblogActions } from '../actions/mikroblogActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entries: state.entity.entities.entries
})

const mapDispatchToProps = (dispatch: Dispatch<MikroblogActions>) => ({
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EntryComponent)