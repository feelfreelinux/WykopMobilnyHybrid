import { Reducer, AnyAction } from 'redux'
import { ListsState, defaultState as listsDefaultState } from './listsReducer'
import { SET_ENTRIES, MikroblogActions } from '../actions/mikroblogActions'
import { EntriesState, defaultState as entriesDefaultState } from './entryListReducer'

export interface MikroblogState extends ListsState, EntriesState {
    readonly entryIds: string[]
}

const defaultState: MikroblogState = {
    entryIds: [],

    ...listsDefaultState,
    ...entriesDefaultState,
}

export const mikroblogReducer: Reducer<MikroblogState, MikroblogActions> = (state = defaultState, action: MikroblogActions) => {
    switch (action.type) {
        default: return state
    }
}