import { Reducer, AnyAction, Action, ActionCreator } from 'redux'
import { Entry } from '../models/'
import { SetHasReachedEndAction, SetRefreshingAction, SetPageAction, ActionType, ActionTypes, SetLoadingAction } from '../actions/listActions'

export interface ListsState {
    readonly refreshing: boolean
    readonly hasReachedEnd: boolean
    readonly page: number,
    readonly entryIds: any
    readonly loading: boolean
}

export const defaultState: ListsState = {
    refreshing: false,
    hasReachedEnd: false,
    page: 1,
    entryIds: [],
    loading: false,
}

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
                console.log("refreshing")
                return {
                    ...state,
                    refreshing: (action as SetRefreshingAction).payload.refreshing
                }
            case actions.SET_PAGE:
                return {
                    ...state,
                    page: (action as SetPageAction).payload.page,
                }
            case actions.SET_LOADING:
                return {
                    ...state,
                    loading: (action as SetLoadingAction).payload.loading,
                }
            default: return wrappedReducer(state, action as any)
        }
    }
}


