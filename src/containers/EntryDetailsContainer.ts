import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import EntryDetails from '../components/EntryDetails'
import { getEntryComments, EntryActions } from '../actions/entryActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryComments: state.entity.entities.entryComments,
  entries: state.entity.entities.entryComments,
  commentIds: state.entry.commentIds
})

const mapDispatchToProps = (dispatch: Dispatch<EntryActions>) => ({
    getEntryComments: (id) => dispatch(getEntryComments(id)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EntryDetails)