import { combineReducers } from 'redux'

import { MikroblogState, mikroblogReducer } from './mikroblogReducer'

export interface RootState {
  mikroblog: MikroblogState
}

export const rootReducer = combineReducers<RootState | undefined>({
  mikroblog: mikroblogReducer
})
