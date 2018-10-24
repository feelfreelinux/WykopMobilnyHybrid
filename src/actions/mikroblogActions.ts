import { Action, ActionCreator } from 'redux'
import { Entry } from '../models'

export const GET_HOT_ENTRIES = 'GET_HOT_ENTRIES'
export const SET_ENTRIES = 'SET_ENTRIES'

export interface GetHotEntries extends Action {
    type: 'GET_HOT_ENTRIES',
    payload: {
      page: number,
      period: string,
    }
}
  

export interface SetEntries extends Action {
    type: 'SET_ENTRIES',
    payload: {
        entries: Entry[]
    }
}

export const getHotEntries: ActionCreator<GetHotEntries> = (page: number) => ({
  type: 'GET_HOT_ENTRIES',
    payload: {
      page,
      period: "24"
    }
})

export type MikroblogActions = SetEntries | GetHotEntries