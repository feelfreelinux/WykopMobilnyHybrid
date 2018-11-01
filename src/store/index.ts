import { ThunkAction } from 'redux-thunk'
import { RootState } from '../reducers'
import { RootActions } from '../actions'

export type ThunkResult<R> = ThunkAction<R, RootState, undefined, RootActions>