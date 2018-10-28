import * as React from 'react'
import { createIconSetFromFontello } from '@expo/vector-icons'
import { View } from 'react-native'
import { Font } from 'expo'
import fontelloConfig from '../../assets/fonts/config.json'
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation'
import MikroblogContainer from '../containers/MikroblogContainer'
import NotImplemented from '../components/NotImplementedPlaceholder'

const OWMIcons = createIconSetFromFontello(fontelloConfig, 'owmglyphs')

class FontIcon extends React.PureComponent<{ name, size, color }, { fontLoaded }> {
    constructor(props) {
        super(props);
        this.state = {
            fontLoaded: false
        }
    }

    async componentDidMount() {
        await Font.loadAsync({
            'owmglyphs': require('../../assets/fonts/OWMGlyphs.ttf'),
        })

        this.setState({ fontLoaded: true });


    }

    render() {
        return (
            <View>
                {
                    this.state.fontLoaded && (
                        <OWMIcons
                            name={this.props.name}
                            size={this.props.size}
                            color={this.props.color}
                        />
                    )
                }
            </View>
        );
    }
}

const Tabs = createBottomTabNavigator(
    {
        LinksScreen: {
            navigationOptions: {
                title: 'Znaleziska',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_links" color={tintColor} size={24} />
            },
            screen: NotImplemented,
        },

        MyWykopScreen: {
            navigationOptions: {
                title: 'Mój Wykop',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_my_wykop" color={tintColor} size={24} />
            },
            screen: NotImplemented,
        },

        MikroblogScreen: {
            navigationOptions: {
                title: 'Mikroblog',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_mirkoblog" color={tintColor} size={24} />
            },
            screen: MikroblogContainer,
        },
        FavoriteScreen: {
            navigationOptions: {
                title: 'Ulubione',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_favourite" color={tintColor} size={24} />
            },
            screen: NotImplemented,
        },
        PrivateMessages: {
            navigationOptions: {
                title: 'Wiadomości',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_messages" color={tintColor} size={24} />
            },
            screen: NotImplemented,
        },

    },
    {
        initialRouteName: 'MikroblogScreen',
        tabBarOptions: {
            activeTintColor: 'tomato',
            inactiveTintColor: 'gray',
            showLabel: true,
        },
    }
)

export default createStackNavigator({
    Home: {
      screen: Tabs,
      navigationOptions: {
        title: 'Mikroblog',
        headerTitleStyle: {textAlign:'center', alignSelf:'center',flex:1}
      }
  }
  }, {
    initialRouteName: 'Home'
  })