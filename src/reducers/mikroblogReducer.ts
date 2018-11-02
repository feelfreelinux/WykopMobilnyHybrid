import { Reducer, AnyAction } from 'redux'
import { ListsState, defaultState as listsDefaultState } from './listsReducer'
import { Entry } from '../models/'
import { GET_HOT_ENTRIES, CLEAR_ENTRIES, SET_REFRESHING, SET_ENTRIES, MikroblogActions, SET_HAS_REACHED_END } from '../actions/mikroblogActions'

export interface MikroblogState extends ListsState{
    readonly entryIds: string[]
}

const defaultState: MikroblogState = {
    entryIds: [],

    ...listsDefaultState
}


const listTypes = {
    
}

export const mikroblogReducer: Reducer<MikroblogState, MikroblogActions> = (state = defaultState, action: MikroblogActions) => {
    switch (action.type) {
        case SET_ENTRIES: {
            return {
                ...state,
                entryIds: [...state.entryIds, ...action.payload.entryIds],
                page: state.page + 1,
            }
        }

        case SET_ENTRIES: {
            return {
                ...state,
                entryIds: action.payload.entryIds
            }
        }
        default: return state;
    }
}