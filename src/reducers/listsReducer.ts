import { Reducer, AnyAction, Action } from 'redux'
import { Entry } from '../models/'

export interface ListsState {
    readonly refreshing: boolean
    readonly hasReachedEnd: boolean
    readonly page: number,
    readonly entryIds: any
}

export const defaultState: ListsState = {
    refreshing: false,
    hasReachedEnd: false,
    page: 1,
    entryIds: []
}

interface ActionTypes {
    SET_REFRESHING: string
    SET_PAGE: string
    SET_HAS_REACHED_END: string
}

interface SetRefreshingAction {
    type: string
    payload: { refreshing: boolean }
}

interface SetHasReachedEndAction {
    type: string
    payload: { hasReachedEnd: boolean }
}

interface SetPageAction {
    type: string
    payload: { page: number }
}

type ActionType<ExtraActionsT extends Action> = SetRefreshingAction | SetPageAction | SetHasReachedEndAction | SetPageAction | ExtraActionsT

export const listsReducer = <StateT extends ListsState, ExtraActionsT extends Action = never>(actions: ActionTypes, wrappedReducer: (s: ListsState, a: ExtraActionsT) => StateT) => {
    return (state: ListsState, action: ActionType<ExtraActionsT>): ListsState => {
        switch (action.type) {
            case actions.SET_HAS_REACHED_END:
                return {
                    ...state,
                    hasReachedEnd: (action as SetHasReachedEndAction).payload.hasReachedEnd,
                    refreshing: state.refreshing && !(action as SetHasReachedEndAction).payload.hasReachedEnd
                }
            case actions.SET_REFRESHING:
                return {
                    ...state,
                    refreshing: (action as SetRefreshingAction).payload.refreshing
                }
            case actions.SET_PAGE:
                return {
                    ...state,
                    page: (action as SetPageAction).payload.page,
                }
            default: return wrappedReducer(state, action as any)
        }
    }
}


