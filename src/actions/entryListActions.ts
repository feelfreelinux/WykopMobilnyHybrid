import { ActionCreator, Action, Dispatch, AnyAction } from "redux"
import { setLoading, setRefreshing, setPage, ActionTypes as ListActionTypes, setHasReachedEnd } from "./listActions"
import { addToState } from "./entityActions"
import { ThunkResult } from "../store";

export interface ActionTypes {
    CLEAR_ENTRIES: string
    ADD_ENTRIES: string
    SET_ENTRIES: string
}

export interface ClearEntriesAction {
    type: string
    payload: {}
}

export interface AddEntriesAction {
    type: string
    payload: { entryIds: string[] }
}

export interface SetEntriesAction {
    type: string
    payload: { entryIds: string[] }
}

export const clearEntries: ActionCreator<ClearEntriesAction> = (type) => ({
    type,
    payload: {}
})

export const addEntries: ActionCreator<AddEntriesAction> = (type, entryIds: string[]) => ({
    type,
    payload: {
        entryIds
    }
})

export const setEntries: ActionCreator<SetEntriesAction> = (type, entryIds: string[]) => ({
    type,
    payload: {
        entryIds
    }
})

export const baseLoadEntries2: (actions: ActionTypes & ListActionTypes, request: Promise<{entities, result}>, refresh: boolean) => ThunkResult<void> = (actions: ActionTypes & ListActionTypes, request: Promise<{entities, result}>, refresh: boolean) => {
    return async (dispatch: Dispatch<AnyAction>, getState, wykopApi) => {
        console.log('ddd')
        console.log(actions)

    }
}
export const baseLoadEntries: (actions: ActionTypes & ListActionTypes, request: Promise<{entities, result}>, refresh: boolean)
    => ThunkResult<void> = (actions: ActionTypes & ListActionTypes, request: Promise<{entities, result}>, refresh: boolean) => {
    return async (dispatch: Dispatch<AnyAction>, getState, wykopApi) => {
        if (refresh) {
            dispatch(setPage(actions.SET_PAGE, 1))
        }

        const state = getState().mikroblog
        if ((!state.refreshing && !state.loading) && !state.hasReachedEnd) {
            if (state.page === 1) {
                dispatch(setRefreshing(actions.SET_REFRESHING, true))
            } else {
                dispatch(setLoading(actions.SET_LOADING, true))
            }
            const entries = await request
            if (entries.result.length === 0) {
                dispatch(setHasReachedEnd(actions.SET_HAS_REACHED_END, true))
            }
            dispatch(addToState(entries.entities))
            if (refresh) {
                dispatch(setEntries(actions.SET_ENTRIES, entries.result))
            } else {
                dispatch(addEntries(actions.ADD_ENTRIES, entries.result))
            }
            dispatch(setPage(actions.SET_PAGE, getState().mikroblog.page + 1))
            dispatch(setRefreshing(actions.SET_REFRESHING,false))
            dispatch(setLoading(actions.SET_LOADING,false))
        }
    }
}

export type ActionType<ExtraActionsT extends Action> = ClearEntriesAction | AddEntriesAction | AddEntriesAction | ExtraActionsT
