import { Reducer, AnyAction, Action, ActionCreator } from 'redux'
import { Entry } from '../models/'
import { AddEntriesAction, SetEntriesAction, ClearEntriesAction, ActionTypes, ActionType } from '../actions/entryListActions'

export interface EntriesState {
    readonly entryIds: string[]
}

export const defaultState: EntriesState = {
    entryIds: []
}

export const entryListReducer = <StateT, ExtraActionsT extends Action = never>(actions: ActionTypes, wrappedReducer: (s: EntriesState, a: ExtraActionsT) => StateT) => {
    return (state: EntriesState, action: ActionType<ExtraActionsT>): EntriesState => {
        switch (action.type) {
            case actions.ADD_ENTRIES:
                return {
                    ...state,
                    entryIds: [...state.entryIds, ...(action as AddEntriesAction).payload.entryIds],
                }
            case actions.SET_ENTRIES:
                return {
                    ...state,
                    entryIds: (action as SetEntriesAction).payload.entryIds,
                }
            case actions.CLEAR_ENTRIES:
                return {
                    ...state,
                    entryIds: [],
                }
            default: return wrappedReducer(state as any, action as any) as any
        }
    }
}


