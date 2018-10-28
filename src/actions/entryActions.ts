import { Action, ActionCreator } from 'redux'
import { Entry } from '../models'

export const GET_ENTRY_COMMENTS = 'GET_ENTRY_COMMENTS'
export const SET_ENTRY_COMMENTS = 'SET_ENTRY_COMMENTS'

export interface GetEntryComments extends Action {
    type: 'GET_ENTRY_COMMENTS',
    payload: {
      id: string,
    }
}


export interface SetEntryComments extends Action {
    type: 'SET_ENTRY_COMMENTS',
    payload: {
        commentIds: string[]
    }
}

export const getEntryComments: ActionCreator<GetEntryComments> = (id: string) => ({
  type: 'GET_ENTRY_COMMENTS',
    payload: {
        id,
    }
})

export type EntryActions = GetEntryComments | SetEntryComments