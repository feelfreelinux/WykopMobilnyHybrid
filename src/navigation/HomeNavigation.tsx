import * as React from 'react'
import { createIconSetFromFontello } from '@expo/vector-icons'
import { View, Image, TouchableOpacity, StatusBar } from 'react-native'
import { Font } from 'expo'
import fontelloConfig from '../../assets/fonts/config.json'
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation'
import MikroblogContainer from '../containers/MikroblogContainer'
import NotImplemented from '../components/NotImplementedPlaceholder'
import EntryDetailsContainer from '../containers/EntryDetailsContainer'
import styles from './styles'

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
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_links" color={tintColor} size={22} />
            },
            screen: NotImplemented,
        },

        MyWykopScreen: {
            navigationOptions: {
                title: 'Mój Wykop',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_my_wykop" color={tintColor} size={22} />
            },
            screen: NotImplemented,
        },

        MikroblogScreen: {
            navigationOptions: {
                title: 'Mikroblog',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_mirkoblog" color={tintColor} size={22} />
            },
            screen: MikroblogContainer,
        },
        FavoriteScreen: {
            navigationOptions: {
                title: 'Ulubione',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_favourite" color={tintColor} size={22} />
            },
            screen: NotImplemented,
        },
        PrivateMessages: {
            navigationOptions: {
                title: 'Wiadomości',
                tabBarIcon: ({ tintColor }) => <FontIcon name="ic_navi_messages" color={tintColor} size={22} />
            },
            screen: NotImplemented,
        },

    },
    {
        initialRouteName: 'MikroblogScreen',
        tabBarOptions: {
            activeTintColor: '#3c84c1',
            inactiveTintColor: 'gray',
            showLabel: true,
            tabStyle: { marginTop: 4 },
            labelStyle: { fontSize: 10, marginTop: -2, marginBottom: 6 }
        },
    }
)

export default createStackNavigator({
    Home: {
        screen: Tabs,
        navigationOptions: {
            headerLeft: (
                <TouchableOpacity style={{ marginLeft: 14 }}>
                    <Image source={{ uri: "https://www.wykop.pl/cdn/c3397992/avatar_def.png" }} style={{ height: 28, width: 28, borderRadius: 40 }} />
                </TouchableOpacity>
            ),
            headerRight: (
                <View style={{ flex: 1, flexDirection: 'row', }}>
                    <TouchableOpacity style={{ marginRight: 16 }}>
                        <FontIcon name="ic_navi_search" color="black" size={24} />
                    </TouchableOpacity>
                    <TouchableOpacity style={{ marginRight: 16 }}>
                        <FontIcon name="ic_refresh" color="black" size={24} />
                    </TouchableOpacity>
                </View>
            ),
            headerStyle: { height: 48 },
        },
    },

    EntryDetails: {
        screen: EntryDetailsContainer,
        navigationOptions: {
            title: 'Wpis',
            headerTitleStyle: { fontSize: 17, marginLeft: 0, fontWeight: 'bold', },
            headerStyle: { height: 48 },
            headerRight: (
                <View style={{ flex: 1, flexDirection: 'row', }}>
                    <TouchableOpacity style={{ marginRight: 16 }}>
                        <FontIcon name="ic_navi_search" color="black" size={24} />
                    </TouchableOpacity>
                    <TouchableOpacity style={{ marginRight: 16 }}>
                        <FontIcon name="ic_refresh" color="black" size={24} />
                    </TouchableOpacity>
                </View>
            ),
        },
    }
}, {
        initialRouteName: 'Home'
    })