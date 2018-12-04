import { Action, ActionCreator } from 'redux'
import { Entry } from '../models'
import { AppEntities } from '../reducers/entityReducer'

export const ADD_TO_STATE = 'ADD_TO_STATE'

export interface AddToStateAction extends Action {
    type: 'ADD_TO_STATE',
    payload: {
        entities: AppEntities
    }
}

export const addToState: ActionCreator<AddToStateAction> = (entities: AppEntities) => ({
  type: 'ADD_TO_STATE',
    payload: {
        entities
    }
})

export type EntitesActions = AddToStateAction