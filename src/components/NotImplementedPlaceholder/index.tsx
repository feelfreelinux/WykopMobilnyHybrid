import React, { PureComponent } from 'react'
import { Text, View, Button } from 'react-native'
import 'react-native-console-time-polyfill';

export default class NotImplementedPlaceholder extends PureComponent<{}, {}> {
    render() {
        return (
            <View>
                <Text>{"Not implemented"}</Text>
            </View>
        );
    }
}
