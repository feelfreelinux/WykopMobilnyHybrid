import React, { Component, PureComponent } from 'react'
import { WebView, NavState } from 'react-native'
import Expo from 'expo'
import { apiKey } from '../../../assets/secrets.json'
import { STORAGE_LOGIN, STORAGE_TOKEN } from '../../constants'
import { wykopApi } from '../../../App'

export default class LoginComponent extends PureComponent<{ isLoggedIn, loginUser: (login, token) => void, navigation }> {
  render() {
    return (
      <WebView
        source={{uri: `https://a2.wykop.pl/login/connect/appkey/${apiKey}`}}
        onNavigationStateChange={this._handleNavigation}
      />
    )
  }

  // Catches url redirection that contains session tokens
  _handleNavigation = (event: NavState) => {
      if (event.url) {
          const url = event.url!! as string
          // Extract token, dispatch action to redux
          if (url.includes('ConnectSuccess')) {
              const login = url.substring(url.indexOf("/login/") + 7, url.indexOf("/token/"))
              const token = url.substring(url.indexOf("/token/") + 7, url.lastIndexOf("/"))

              this.props.loginUser(login,token)
          }
      }
  }

  _saveCredentials = async (login: string, token: string) => {
    await Expo.SecureStore.setItemAsync(STORAGE_LOGIN, login)
    await Expo.SecureStore.setItemAsync(STORAGE_TOKEN, token)
    return
  }
}