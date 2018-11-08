import { connect } from 'react-redux'
import { RootState } from '../reducers'
import { Dispatch } from 'redux'
import AuthorComponent from '../components/Author'
import { MikroblogActions } from '../actions/mikroblogActions';

const mapStateToProps = (state: RootState, props) => ({
  ...props,
  author: state.entity.entities.authors[props.authorId]
})

const mapDispatchToProps = (dispatch: Dispatch<MikroblogActions>) => ({
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(AuthorComponent)