import { ThunkAction } from 'redux-thunk'
import { RootState } from '../reducers'
import { RootActions } from '../actions'
import WykopApi from '../api/WykopApi'

export type ThunkResult<R> = ThunkAction<R, RootState, WykopApi, RootActions>