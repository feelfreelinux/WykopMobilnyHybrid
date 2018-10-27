import { Reducer, AnyAction } from 'redux'
import { Entry } from '../models/'
import { GET_HOT_ENTRIES, CLEAR_ENTRIES, SET_REFRESHING, SET_ENTRIES, MikroblogActions, SET_HAS_REACHED_END } from '../actions/mikroblogActions'

export interface MikroblogState {
    readonly entryIds: string[]
    readonly refreshing: boolean
    readonly hasReachedEnd: boolean
    readonly page: number,
}

const defaultState: MikroblogState = {
    entryIds: [],
    refreshing: false,
    hasReachedEnd: false,
    page: 1,
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

        case SET_REFRESHING: {
            return {
                ...state,
                refreshing: action.payload.refreshing
            }
        }

        case CLEAR_ENTRIES: {
            return {
                ...state,
                entryIds: []
            }
        }

        case SET_HAS_REACHED_END: {
            return {
                ...state,
                hasReachedEnd: action.payload.hasReachedEnd,
                refreshing: state.refreshing && !action.payload.hasReachedEnd
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