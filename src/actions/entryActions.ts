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
    return async (dispatch: Dispatch<AnyAction>, getState) => { 
        fetch(`http://a2.wykop.pl/entries/entry/${entryId}/appkey/aNd401dAPp`, {
            method: 'GET',
        }).then(async (el) => {
            const data = await el.json()
            const comments = data.data.comments.map((el) => camelCaseKeys(el))
            data.data.comments = comments
            const normalized = (normalize(camelCaseKeys(data.data), entrySchema))
            dispatch(addToState(normalized.entities))
            dispatch(setEntryComments(navigatorKey, normalized.entities.entries[entryId].comments))
        })
    }
}


export type EntryActions = SetEntryComments