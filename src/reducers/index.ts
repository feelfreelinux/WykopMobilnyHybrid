import { combineReducers } from 'redux'

import { MikroblogState, mikroblogReducer } from './mikroblogReducer'
import { EntityState, entityReducers } from './entityReducer'
import { EntryState, entryReducer } from './entryReducer'

export interface RootState {
  mikroblog: MikroblogState
  entity: EntityState
  entry: EntryState
}

export const rootReducer = combineReducers<RootState>({
  mikroblog: mikroblogReducer,
  entity: entityReducers,
  entry: entryReducer,
})
