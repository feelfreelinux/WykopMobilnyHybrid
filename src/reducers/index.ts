import { combineReducers } from 'redux'

import { MikroblogState, mikroblogReducer } from './mikroblogReducer'
import { EntityState, entityReducers } from './entityReducer'
import { EntriesState, entryReducer } from './entryReducer'
import { listsReducer } from './listsReducer'


import * as mikroblogActions from "../actions/mikroblogActions"
export interface RootState {
  mikroblog: MikroblogState
  entity: EntityState
  entry: EntriesState
}

export const rootReducer = combineReducers<RootState>({
  mikroblog: listsReducer(mikroblogActions, mikroblogReducer),
  entity: entityReducers,
  entry: entryReducer,
})
