import { ActionCreator, Action } from "redux"

export interface ActionTypes {
    SET_REFRESHING: string
    SET_PAGE: string
    SET_HAS_REACHED_END: string
    SET_LOADING: string
}

export interface SetRefreshingAction {
    type: string
    payload: { refreshing: boolean }
}

export interface SetHasReachedEndAction {
    type: string
    payload: { hasReachedEnd: boolean }
}

export interface SetLoadingAction {
    type: string
    payload: { loading: boolean }
}

export interface SetPageAction {
    type: string
    payload: { page: number }
}

export const setRefreshing: ActionCreator<SetRefreshingAction> = (type, refreshing: boolean) => ({
    type,
    payload: {
        refreshing,
    }
})

export const setLoading: ActionCreator<SetLoadingAction> = (type, loading: boolean) => ({
    type,
    payload: {
        loading,
    }
})

export const setPage: ActionCreator<SetPageAction> = (type, page: number) => ({
    type,
    payload: {
        page,
    }
})

export const setHasReachedEnd: ActionCreator<SetHasReachedEndAction> = (type, hasReachedEnd: boolean) => ({
    type,
    payload: {
        hasReachedEnd,
    }
})

export type ActionType<ExtraActionsT extends Action> = SetLoadingAction | SetRefreshingAction | SetPageAction | SetHasReachedEndAction | SetPageAction | ExtraActionsT
