import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch, AnyAction } from 'redux'
import EntryDetails from '../components/EntryDetails'
import { getEntryComments, EntryActions } from '../actions/entryActions';
import { ThunkDispatch } from 'redux-thunk';
import { RootActions } from '../actions'
import entryDetailsSelector from '../selectors/entryDetailsSelector'

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryComments: state.entity.entities.entryComments,
  entries: state.entity.entities.entryComments,
  commentIds: entryDetailsSelector(state, props)
})

const mapDispatchToProps = (dispatch: ThunkDispatch<RootState, undefined, RootActions>, ownProps) => ({
    getEntryComments: (id) => dispatch(getEntryComments(ownProps.navigation.state.key, id)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EntryDetails)