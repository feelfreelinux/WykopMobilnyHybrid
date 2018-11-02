import { ActionCreator, Action } from "redux"

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

export type ActionType<ExtraActionsT extends Action> = ClearEntriesAction | AddEntriesAction | AddEntriesAction | ExtraActionsT
