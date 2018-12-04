import { Reducer } from 'redux'
import { Entry, Author, EntryComment } from '../models/'
import { ADD_TO_STATE, EntitesActions } from '../actions/entityActions'
import 'react-native-console-time-polyfill'
export type AppEntities = {
    authors: {
      [authorId: string]: Author
    }
    entries: {
      [entryId: string]: Entry
    }

    entryComments: {
        [entryCommentId: string]: EntryComment
    }
  }

export interface EntityState {

    readonly entities: AppEntities
}

const defaultState: EntityState = {
    entities: {
        authors: {},
        entries: {},
        entryComments: {},
    }
}

export const entityReducers: Reducer<EntityState, EntitesActions> = (state = defaultState, action: EntitesActions) => {
    switch (action.type) {
        case ADD_TO_STATE: {
            return {
                ...state,
                entities: {
                    authors: { ...state.entities.authors, ...action.payload.entities.authors },
                    entries: { ...state.entities.entries, ...action.payload.entities.entries },
                    entryComments: { ...state.entities.entryComments, ...action.payload.entities.entryComments },
                }
            }
        }
        default: return state;
    }
}