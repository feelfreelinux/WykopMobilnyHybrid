import { Reducer, AnyAction } from 'redux'
import { Entry } from '../models/'
import { SET_ENTRY_COMMENTS, EntryActions } from '../actions/entryActions'
import { createSelector } from 'reselect'

export interface EntriesState {
    [key: string] : EntryState
}

export interface EntryState {
    readonly commentIds: string[],
}

const defaultState: EntriesState = {
}

export const entryReducer: Reducer<EntriesState, EntryActions> = (state = defaultState, action: EntryActions) => {
    switch (action.type) {
        case SET_ENTRY_COMMENTS: {
            return {
                ...state,
                [action.payload.navigatorKey]: {
                    commentIds: action.payload.commentIds
                }
            }
        }
        default: return state;
    }
}