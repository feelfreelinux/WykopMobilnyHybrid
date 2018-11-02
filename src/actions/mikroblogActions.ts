import { Action, ActionCreator, Dispatch, AnyAction } from 'redux'
import { ThunkResult } from '../store/index'
import { Entry } from '../models'
import { normalize, schema } from 'normalizr'
import { entriesSchema, entrySchema } from '../models/Schema'
const camelCaseKeys = require('camelcase-keys')
import { addToState } from '../actions/entityActions'
import { setRefreshing, setHasReachedEnd } from './listActions'

export const ADD_HOT_ENTRIES = 'ADD_HOT_ENTRIES'
export const GET_HOT_ENTRIES = 'GET_HOT_ENTRIES'
export const SET_ENTRIES = 'SET_ENTRIES'
export const CLEAR_ENTRIES = 'CLEAR_ENTRIES'

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
        if (!getState().mikroblog.refreshing && !getState().mikroblog.hasReachedEnd) {
            dispatch(setRefreshing(SET_REFRESHING, true))
            const entries = await wykopApi.entries.getHotEntries("12", getState().mikroblog.page)
            if (entries.result.length === 0) {
                dispatch(setHasReachedEnd(SET_HAS_REACHED_END, true))
            }
            dispatch(addToState(entries.entities))
            dispatch({ type: SET_ENTRIES, payload: { entryIds: entries.result } })
            dispatch(setRefreshing(SET_REFRESHING,false))
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