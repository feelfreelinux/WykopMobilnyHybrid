import { Action, Dispatch, AnyAction, ActionCreator } from 'redux'
import { Entry } from '../models'
import { ThunkResult } from '../store/index'
import { normalize, schema } from 'normalizr'
import { addToState } from './entityActions' 
import { entriesSchema, entrySchema } from '../models/Schema'
const camelCaseKeys = require('camelcase-keys')

export const SET_ENTRY_COMMENTS = 'SET_ENTRY_COMMENTS'

export interface SetEntryComments extends Action {
    type: 'SET_ENTRY_COMMENTS',
    payload: {
        commentIds: string[]
        navigatorKey: string
    }
}

export const setEntryComments: ActionCreator<SetEntryComments> = (navigatorKey: string, commentIds: string[]) => ({
    type: 'SET_ENTRY_COMMENTS',
      payload: {
          navigatorKey,
          commentIds,
      }
  })

export const getEntryComments: (navigatorKey, entryId) => ThunkResult<void> = (navigatorKey: string, entryId: string) => {
    return async (dispatch: Dispatch<AnyAction>, getState, api) => { 
        const entry = await api.entries.getEntry(entryId)
        dispatch(addToState(entry.entities))
        dispatch(setEntryComments(navigatorKey, entry.entities.entries[entryId].comments))
    }
}


export type EntryActions = SetEntryComments