import * as React from 'react'
import { createIconSetFromFontello } from '@expo/vector-icons'
import { View, Image, Text, TouchableOpacity, StatusBar, Button } from 'react-native'
import { Font } from 'expo'
import fontelloConfig from '../../../assets/fonts/config.json'
import { createMaterialTopTabNavigator, createBottomTabNavigator, createStackNavigator, withNavigation } from 'react-navigation'
import MikroblogContainer from '../../containers/MikroblogContainer'
import NotImplemented from '../../components/NotImplementedPlaceholder'
import EntryDetailsContainer from '../../containers/EntryDetailsContainer'
import { MikroblogPageType } from '../../components/Mikroblog';
import AppbarUserContainer from '../../containers/AppbarUserContainer';

const OWMIcons = createIconSetFromFontello(fontelloConfig, 'owmglyphs')

const MikroTab = ({ routeKey, title, navigation }) => {
    return (<View style={{ flex: 1, flexGrow: 1 }}>
        <TouchableOpacity
            style={{
                backgroundColor: '#fafafa',
                flex: 1,
                justifyContent: 'center',
                alignItems: 'center'
            }}
            onPress={() => {
                navigation.dispatch({
                    key: routeKey,
                    type: 'ReplaceCurrentScreen',
                    routeName: routeKey,
                } as any)
            }}>
            <Text style={{ fontWeight: navigation.routeName === routeKey ? 'bold' : 'normal' }}>{title}</Text>
        </TouchableOpacity>
    </View>)
}

const MikroblogTabStack = createStackNavigator({
    Newest: () => (<MikroblogContainer pageType={MikroblogPageType.NEWEST} />),
    Hot12: () => (<MikroblogContainer pageType={MikroblogPageType.HOT_12} />),
    Hot24: () => (<MikroblogContainer pageType={MikroblogPageType.HOT_24} />),
    Hot6: () => (<MikroblogContainer pageType={MikroblogPageType.HOT_6} />),
    Active: () => (<MikroblogContainer pageType={MikroblogPageType.ACTIVE} />),
}, {
        navigationOptions: ({ navigation }) => {
            return {

                header: (
                    <View
                        style={{
                            height: 35,
                        }}
                    >

                        <View style={{ backgroundColor: 'white', height: 48, flex: 1, flexDirection: 'row' }}>
                            <MikroTab routeKey={'Newest'} title={"Nowe"} navigation={navigation} />
                            <MikroTab routeKey={'Active'} title={"Aktywne"} navigation={navigation} />
                            <MikroTab routeKey={'Hot6'} title={"6h"} navigation={navigation} />
                            <MikroTab routeKey={'Hot12'} title={"12h"} navigation={navigation} />
                            <MikroTab routeKey={'Hot24'} title={"24h"} navigation={navigation} />
                        </View></View>),
                headerStyle: { height: 48 },
            }
        },

        initialRouteName: 'Newest',
    })
const prevGetStateForActionHomeStack = MikroblogTabStack.router.getStateForAction;
MikroblogTabStack.router.getStateForAction = (action, state) => {
    if (state && (action.type as any) === 'ReplaceCurrentScreen') {
        const routes = state.routes.slice(0, state.routes.length - 1);
        routes.push(action);
        return {
            ...state,
            routes,
            index: routes.length - 1,
        };
    }
    return prevGetStateForActionHomeStack(action, state);
}


class FontIcon extends React.PureComponent<{ name, size, color }, { fontLoaded }> {
    constructor(props) {
        super(props);
        this.state = {
            fontLoaded: false
        }
    }

    async componentDidMount() {
        await Font.loadAsync({
            'owmglyphs': require('../../../assets/fonts/OWMGlyphs.ttf'),
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
            screen: MikroblogTabStack,
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

export default class HomeComponent extends React.PureComponent<{ restoreAuthState, navigation, avatarUrl }> {
    static navigationOptions = ({ navigation }) => {
        return {
            headerLeft: (
                <AppbarUserContainer />
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
        }
    }

    componentDidMount() {
        this.props.restoreAuthState()
        this.props.navigation.setParams({ avatarPressed: this._avatarPressed })
        this.props.navigation.setParams({ avatarUrl: this.props.avatarUrl })
    }

    _avatarPressed = () => {
        this.props.navigation.navigate('LoginScreen')
    }

    render() {
        return (<Tabs />)
    }
}