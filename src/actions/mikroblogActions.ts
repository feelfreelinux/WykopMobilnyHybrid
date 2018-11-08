import { Action, ActionCreator, Dispatch, AnyAction } from 'redux'
import { ThunkResult } from '../store/index'
import { addToState } from '../actions/entityActions'
import { setRefreshing, setHasReachedEnd, setPage, setLoading } from './listActions'
import { addEntries, setEntries, clearEntries, baseLoadEntries } from './entryListActions'
import { ThunkDispatch } from 'redux-thunk';

export const GET_HOT_ENTRIES = 'GET_HOT_ENTRIES'
export const SET_ENTRIES = 'MIKROBLOG_SET_ENTRIES'
export const CLEAR_ENTRIES = 'MIKROBLOG_CLEAR_ENTRIES'
export const ADD_ENTRIES = 'MIKROBLOG_ADD_ENTRIES'

export const SET_LOADING = 'MIKROBLOG_SET_LOADING'
export const SET_PAGE = 'MIKROBLOG_SET_PAGE'
export const SET_REFRESHING = 'MIKROBLOG_SET_REFRESHING'
export const SET_HAS_REACHED_END = 'MIKROBLOG_SET_HAS_REACHED_END'

const Actions = {
    GET_HOT_ENTRIES,
    SET_ENTRIES,
    CLEAR_ENTRIES,
    ADD_ENTRIES,
    SET_LOADING,
    SET_PAGE,
    SET_REFRESHING,
    SET_HAS_REACHED_END
}

export interface GetHotEntries extends Action {
    type: 'GET_HOT_ENTRIES',
    payload: {
      period: string,
    }
}


export const loadHotEntriesAction: (period: string, refresh: boolean) => ThunkResult<void> = (period, refresh) => {
    return async (dispatch, getState, wykopApi) => {
        dispatch(baseLoadEntries(Actions, wykopApi.entries.getHotEntries(period, getState().mikroblog.page), refresh))
    }
}

export const loadActiveEntries: (refresh: boolean) => ThunkResult<void> = (refresh) => {
    return async (dispatch, getState, wykopApi) => {
        dispatch(baseLoadEntries(Actions, wykopApi.entries.getActiveEntries(getState().mikroblog.page), refresh))
    }
}

export const loadStreamEntries: (refresh: boolean) => ThunkResult<void> = (refresh) => {
    return async (dispatch, getState, wykopApi) => {
        dispatch(baseLoadEntries(Actions, wykopApi.entries.getStreamEntries(getState().mikroblog.page), refresh))
    }
}

export const getHotEntries: ActionCreator<GetHotEntries> = (period: string) => ({
    type: 'GET_HOT_ENTRIES',
    payload: {
        period,
    }
})

export type MikroblogActions = GetHotEntries