import { Action, ActionCreator, Dispatch, AnyAction } from 'redux'
import { ThunkResult } from '../store/index'
import { Entry } from '../models'
import { normalize, schema } from 'normalizr'
import { entriesSchema, entrySchema } from '../models/Schema'
const camelCaseKeys = require('camelcase-keys')
import { addToState } from '../actions/entityActions'

export const ADD_HOT_ENTRIES = 'ADD_HOT_ENTRIES'
export const GET_HOT_ENTRIES = 'GET_HOT_ENTRIES'
export const SET_ENTRIES = 'SET_ENTRIES'
export const SET_PAGE = 'MIKROBLOG_SET_PAGE'

export const CLEAR_ENTRIES = 'CLEAR_ENTRIES'
export const SET_REFRESHING = 'SET_REFRESHING'
export const SET_HAS_REACHED_END = 'SET_HAS_REACHED_END'

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
    return async (dispatch: Dispatch<AnyAction>, getState) => { 
        if (!getState().mikroblog.refreshing && !getState().mikroblog.hasReachedEnd) {
            dispatch({ type: "SET_MIKROBLOG_REFRESHING", payload: { refreshing: true } });
                fetch(`http://a2.wykop.pl/entries/hot/period/12/page/${getState().mikroblog.page.toString()}/appkey/aNd401dAPp`, {
                    method: 'GET',
                }).then(async (el) => {
                    const data = await el.json()
                    const normalized = (normalize(camelCaseKeys(data.data), entriesSchema))
                    if (data.data.length === 0) {
                        dispatch({ type: "SET_MIKROBLOG_HAS_REACHED_END", payload: { hasReachedEnd: true } })
                    }
                    dispatch(addToState(normalized.entities))
                    dispatch({ type: SET_ENTRIES, payload: { entryIds: normalized.result } })
                    dispatch({ type: "SET_MIKROBLOG_REFRESHING", payload: { refreshing: false } })
                })
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