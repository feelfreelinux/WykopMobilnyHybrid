import { Reducer, AnyAction } from 'redux'
import { Entry } from '../models/'

export interface ListsState {
    readonly refreshing: boolean
    readonly hasReachedEnd: boolean
    readonly page: number,
    readonly entryIds: any
}

const defaultState: ListsState = {
    refreshing: false,
    hasReachedEnd: false,
    page: 1,
    entryIds: []
}

export const listsReducer = <A extends any, Y extends AnyAction>(name, reducer: Reducer<A, Y>) => {
    return (state = defaultState, action: AnyAction) => {
        switch (action.type) {
            case `SET_${name}_REFRESHING`: {
                return {
                    ...state,
                    refreshing: action.payload.refreshing
                }
            }

            case `SET_${name}_PAGE`: {
                return {
                    ...state,
                    page: action.payload.page,
                }
            }

            case `SET_${name}_HAS_REACHED_END`: {
                return {
                    ...state,
                    hasReachedEnd: action.payload.hasReachedEnd,
                    refreshing: state.refreshing && !action.payload.hasReachedEnd
                }
            }
            default: return reducer(state as any, action as any);
        }
    }
}