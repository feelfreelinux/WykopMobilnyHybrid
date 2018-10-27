import { Action, ActionCreator } from 'redux'
import { Entry } from '../models'

export const ADD_HOT_ENTRIES = 'ADD_HOT_ENTRIES'
export const GET_HOT_ENTRIES = 'GET_HOT_ENTRIES'
export const SET_ENTRIES = 'SET_ENTRIES'

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

export interface SetRefreshing extends Action {
    type: 'SET_REFRESHING',
    payload: {
        refreshing: boolean
    }
}

export interface SetHasReachedEnd extends Action {
    type: 'SET_HAS_REACHED_END',
    payload: {
        hasReachedEnd: boolean
    }
}

export interface SetEntries extends Action {
    type: 'SET_ENTRIES',
    payload: {
        entryIds: string[]
    }
}

export const getHotEntries: ActionCreator<GetHotEntries> = (period: string) => ({
  type: 'GET_HOT_ENTRIES',
    payload: {
      period,
    }
})

export type MikroblogActions = SetEntries | GetHotEntries | ClearEntries | SetRefreshing | SetHasReachedEnd