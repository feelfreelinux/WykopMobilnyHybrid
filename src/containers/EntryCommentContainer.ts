import { connect } from 'react-redux'
import { RootState } from '../reducers'
import EntryComment from '../components/EntryComment'

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryComment: state.entity.entities.entryComments[props.commentId],
})

const mapDispatchToProps = (dispatch) => ({
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EntryComment)