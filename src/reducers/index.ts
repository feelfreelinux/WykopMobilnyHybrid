import { combineReducers } from 'redux'

import { MikroblogState, mikroblogReducer } from './mikroblogReducer'
import { EntityState, entityReducers } from './entityReducer'

export interface RootState {
  mikroblog: MikroblogState
  entity: EntityState
}

export const rootReducer = combineReducers<RootState>({
  mikroblog: mikroblogReducer,
  entity: entityReducers,
})
