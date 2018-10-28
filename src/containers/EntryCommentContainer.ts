import { connect } from 'react-redux'
import { RootState } from '../reducers'
import EntryComment from '../components/EntryComment'

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  entryComments: state.entity.entities.entryComments,
})

const mapDispatchToProps = (dispatch) => ({
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EntryComment)