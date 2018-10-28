import { Reducer, AnyAction } from 'redux'
import { Entry } from '../models/'
import { GET_ENTRY_COMMENTS, SET_ENTRY_COMMENTS, EntryActions } from '../actions/entryActions'

export interface EntryState {
    readonly commentIds: string[],
}

const defaultState: EntryState = {
    commentIds: []
}

export const entryReducer: Reducer<EntryState, EntryActions> = (state = defaultState, action: EntryActions) => {
    switch (action.type) {
        case SET_ENTRY_COMMENTS: {
            return {
                ...state,
                commentIds: action.payload.commentIds,
            }
        }
        default: return state;
    }
}