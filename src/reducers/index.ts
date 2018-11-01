import { combineReducers } from 'redux'

import { MikroblogState, mikroblogReducer } from './mikroblogReducer'
import { EntityState, entityReducers } from './entityReducer'
import { EntryState, entryReducer } from './entryReducer'
import { listsReducer } from './listsReducer'

export interface RootState {
  mikroblog: MikroblogState
  entity: EntityState
  entry: EntryState
}

export const rootReducer = combineReducers<RootState>({
  mikroblog: listsReducer('MIKROBLOG', mikroblogReducer) as any,
  entity: entityReducers,
  entry: entryReducer,
})
