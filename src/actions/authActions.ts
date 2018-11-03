import { Action, Dispatch, AnyAction, ActionCreator } from 'redux'
import { ThunkResult } from '../store/index'
import Expo from 'expo'
import { STORAGE_LOGIN, STORAGE_TOKEN } from '../constants'
import { navigate } from '../navigation/NavigationService'

export const SET_CREDENTIALS = 'SET_CREDENTIALS'
export const SET_LOGGEDIN = 'SET_LOGGEDIN'

export interface SetCredentialsAction extends Action {
    type: 'SET_CREDENTIALS',
    payload: {
        login: string
        token: string
    }
}

export interface SetLoggedInAction extends Action {
    type: 'SET_LOGGEDIN',
    payload: {
        avatarUrl: string
        login: string
    }
}

export const setLoggedIn: ActionCreator<SetLoggedInAction> = (login: string, avatarUrl: string) => ({
    type: 'SET_LOGGEDIN',
      payload: {
        login,
        avatarUrl,
      }
  })

export const setCredentials: ActionCreator<SetCredentialsAction> = (login: string, token: string) => ({
    type: 'SET_CREDENTIALS',
      payload: {
        login,
        token,
      }
  })

export const loginUser: (login, token) => ThunkResult<void> = (login: string, token: string) => {
    return async (dispatch: Dispatch<AnyAction>, getState, api) => {
        await Expo.SecureStore.setItemAsync(STORAGE_LOGIN, login)
        await Expo.SecureStore.setItemAsync(STORAGE_TOKEN, token)
        dispatch(setCredentials(login, token))
        const user = await api.login(login, token)
        dispatch(setLoggedIn(user.profile.login, user.profile.avatar))

        // Navigate to HomeScreen
        navigate('HomeScreen')
    }
}

export const restoreAuthState: () => ThunkResult<void> = () => {
    return async (dispatch: Dispatch<AnyAction>, getState, api) => {
        const login = await Expo.SecureStore.getItemAsync(STORAGE_LOGIN)
        const token = await  Expo.SecureStore.getItemAsync(STORAGE_TOKEN)
        if (login && token) {
            dispatch(setCredentials(login, token))
            const user = await api.login(login, token)
            dispatch(setLoggedIn(user.profile.login, user.profile.avatar))
        }
    }
}


export type AuthActions = SetCredentialsAction | SetLoggedInAction