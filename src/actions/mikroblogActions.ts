import { Action, ActionCreator, Dispatch, AnyAction } from 'redux'
import { ThunkResult } from '../store/index'
import { addToState } from '../actions/entityActions'
import { setRefreshing, setHasReachedEnd, setPage, setLoading } from './listActions'
import { addEntries, setEntries, clearEntries } from './entryListActions'

export const GET_HOT_ENTRIES = 'GET_HOT_ENTRIES'
export const SET_ENTRIES = 'MIKROBLOG_SET_ENTRIES'
export const CLEAR_ENTRIES = 'MIKROBLOG_CLEAR_ENTRIES'
export const ADD_ENTRIES = 'MIKROBLOG_ADD_ENTRIES'

export const SET_LOADING = 'MIKROBLOG_SET_LOADING'
export const SET_PAGE = 'MIKROBLOG_SET_PAGE'
export const SET_REFRESHING = 'MIKROBLOG_SET_REFRESHING'
export const SET_HAS_REACHED_END = 'MIKROBLOG_SET_HAS_REACHED_END'

export interface GetHotEntries extends Action {
    type: 'GET_HOT_ENTRIES',
    payload: {
      period: string,
    }
}

export interface AddHotEntries extends Action {
    type: 'ADD_HOT_ENTRIES',
    payload: {
      period: string,
    }
}

export interface ClearEntries extends Action {
    type: 'CLEAR_ENTRIES',
    payload: {
        entryIds: string[]
    }
}

export interface SetEntries extends Action {
    type: 'SET_ENTRIES',
    payload: {
        entryIds: string[]
    }
}


export const loadHotEntriesAction: (period: string) => ThunkResult<void> = () => {
    return async (dispatch: Dispatch<AnyAction>, getState, wykopApi) => { 
        const state = getState().mikroblog
        if ((!state.refreshing && !state.loading) && !state.hasReachedEnd) {
            if (state.page === 1) {
                dispatch(setRefreshing(SET_REFRESHING, true))
            } else {
                dispatch(setLoading(SET_LOADING, true))
            }
            const entries = await wykopApi.entries.getHotEntries("12", getState().mikroblog.page)
            if (entries.result.length === 0) {
                dispatch(setHasReachedEnd(SET_HAS_REACHED_END, true))
            }
            dispatch(addToState(entries.entities))
            dispatch(addEntries(ADD_ENTRIES, entries.result))
            dispatch(setPage(SET_PAGE, getState().mikroblog.page + 1))
            dispatch(setRefreshing(SET_REFRESHING,false))
            dispatch(setLoading(SET_LOADING,false))
        }
    }
}

export const getHotEntries: ActionCreator<GetHotEntries> = (period: string) => ({
    type: 'GET_HOT_ENTRIES',
    payload: {
        period,
    }
})

export type MikroblogActions = SetEntries | GetHotEntries | ClearEntries