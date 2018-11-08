import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import EntryComponent from '../components/Entry'
import { MikroblogActions } from '../actions/mikroblogActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entry: state.entity.entities.entries[props.entryId]
})

const mapDispatchToProps = (dispatch: Dispatch<MikroblogActions>) => ({
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EntryComponent)