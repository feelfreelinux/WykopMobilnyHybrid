import { combineReducers } from 'redux'

import { MikroblogState, mikroblogReducer } from './mikroblogReducer'
import { EntityState, entityReducers } from './entityReducer'
import { EntriesState, entryReducer } from './entryReducer'
import { listsReducer } from './listsReducer'
import { authReducer, AuthState } from './authReducer'
import { entryListReducer } from './entryListReducer'

import * as mikroblogActions from "../actions/mikroblogActions"
export interface RootState {
  mikroblog: MikroblogState
  entity: EntityState
  entry: EntriesState
  auth: AuthState
}

export const rootReducer = combineReducers<RootState>({
  mikroblog: listsReducer(mikroblogActions, entryListReducer(mikroblogActions, mikroblogReducer) as any),
  entity: entityReducers,
  entry: entryReducer,
  auth: authReducer,
})
