import * as React from 'react'
import { createIconSetFromFontello } from '@expo/vector-icons'
import { View, Image, TouchableOpacity, StatusBar } from 'react-native'
import { Font } from 'expo'
import fontelloConfig from '../../assets/fonts/config.json'
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation'
import MikroblogContainer from '../containers/MikroblogContainer'
import NotImplemented from '../components/NotImplementedPlaceholder'
import EntryDetailsContainer from '../containers/EntryDetailsContainer'
import LoginComponent from '../components/Login';
import HomeComponent from '../components/Home'
import LoginContainer from '../containers/LoginContainer';
import HomeContainer from '../containers/HomeContainer';

export default createStackNavigator({
    HomeScreen: {
        screen: HomeContainer
    },

    EntryDetails: {
        screen: EntryDetailsContainer,
        navigationOptions: {
            title: 'Wpis',
            headerTitleStyle: { fontSize: 17, marginLeft: 0, fontWeight: 'bold', },
            headerStyle: { height: 48 },
            headerRight: (
                <View style={{ flex: 1, flexDirection: 'row', }}>

                </View>
            ),
        },
    },

    LoginScreen: {
        screen: LoginContainer,
        navigationOptions: {
            title: 'Zaloguj się',
            headerTitleStyle: { fontSize: 17, marginLeft: 0, fontWeight: 'bold', },
            headerStyle: { height: 48 },
        }
    }
}, {
        initialRouteName: 'HomeScreen'
    })