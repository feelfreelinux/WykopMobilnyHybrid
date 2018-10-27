import { Reducer, AnyAction } from 'redux'
import { Entry } from '../models/'
import { GET_HOT_ENTRIES, SET_ENTRIES, MikroblogActions } from '../actions/mikroblogActions'

export interface MikroblogState {
    readonly entryIds: string[]
}

const defaultState: MikroblogState = {
    entryIds: [],
}

export const mikroblogReducer: Reducer<MikroblogState, MikroblogActions> = (state = defaultState, action: MikroblogActions) => {
    switch (action.type) {
        case SET_ENTRIES: {
            return {
                ...state,
                entryIds: action.payload.entryIds
            }
        }
        default: return state;
    }
}