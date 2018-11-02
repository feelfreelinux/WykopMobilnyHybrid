import { createSelector } from 'reselect'
import { RootState } from '../reducers';

const getCommentIds = (state: RootState, props) =>
  state.entry[props.navigation.state.key] ? state.entry[props.navigation.state.key].commentIds : []

const getCommentIdsSelector = createSelector(
  [ getCommentIds ],
  (commentIds) => commentIds
)

export default getCommentIdsSelector