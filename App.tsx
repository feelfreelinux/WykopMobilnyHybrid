import * as React from 'react'
import { createStackNavigator } from 'react-navigation'
import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
// Imports
import MikroblogContainer from './src/containers/MikroblogContainer'
import { rootReducer } from './src/reducers'
import { MikroblogMiddleware } from './src/store/mikroblogMiddleware'
 

const store = createStore(rootReducer, applyMiddleware(MikroblogMiddleware))

const Stack = createStackNavigator(
  {
    MikroblogScreen: MikroblogContainer,

  },
  {
    initialRouteName: 'MikroblogScreen',
  }  
)

export default class App extends React.Component<{}> {
  render() {
    return (
      <Provider store={store}>
        <Stack/>
      </Provider>
    )
  }
}
