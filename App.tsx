import * as React from 'react'
import { createStackNavigator } from 'react-navigation'
import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import { LightTheme, AppTheme } from './src/theme'
import MikroblogContainer from './src/containers/MikroblogContainer'
import { rootReducer } from './src/reducers'
import { MikroblogMiddleware } from './src/store/mikroblogMiddleware'
import * as PropTypes from 'prop-types'
import EStyleSheet from 'react-native-extended-stylesheet'
import { createIconSetFromFontello } from '@expo/vector-icons'
import { Font } from 'expo'
import fontelloConfig from './assets/fonts/config.json'
export const OWMIcons = createIconSetFromFontello(fontelloConfig, 'owmglyphs')

EStyleSheet.build(LightTheme)

const store = createStore(rootReducer, applyMiddleware(MikroblogMiddleware))

const Stack = createStackNavigator(
  {
    MikroblogScreen: MikroblogContainer,

  },
  {
    initialRouteName: 'MikroblogScreen',
  }  
)

interface ThemeContextProvider {
  theme: AppTheme
}

export default class App extends React.Component<{}> implements React.ChildContextProvider<ThemeContextProvider> {
  componentDidMount() {
    Font.loadAsync({
      'owmglyphs': require('./assets/fonts/OWMGlyphs.ttf'),
    })
  }

  render() {
    return (
      <Provider store={store}>
        <Stack/>
      </Provider>
    )
  }

  getChildContext() {
    return {
      theme: LightTheme
    };
  }

  static childContextTypes = {
    theme: PropTypes.object
  }
}