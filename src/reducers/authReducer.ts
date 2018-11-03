import { Reducer, AnyAction } from 'redux'
import { ListsState, defaultState as listsDefaultState } from './listsReducer'
import { AuthActions, setCredentials, SET_CREDENTIALS, SET_LOGGEDIN } from '../actions/authActions'

export interface AuthState {
    readonly login: string,
    readonly token: string,
    readonly avatarUrl: string,
    readonly loggedIn: boolean,
}

const defaultState: AuthState = {
    login: '',
    token: '',
    loggedIn: false,
    avatarUrl: 'https://www.wykop.pl/cdn/c3397992/avatar_def.png',
}

export const authReducer: Reducer<AuthState, AuthActions> = (state = defaultState, action: AuthActions) => {
    switch (action.type) {
        case SET_CREDENTIALS: {
            return {
                ...state,
                login: action.payload.login,
                token: action.payload.token,
            }
        }

        case SET_LOGGEDIN: {
            return {
                ...state,
                login: action.payload.login,
                avatarUrl: action.payload.avatarUrl,
                loggedIn: true,
            }
        }
        default: return state
    }
}