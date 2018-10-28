import React, { PureComponent } from 'react'
import { Embed } from '../../models'
import { Text, View } from 'react-native'

export default class NotImplementedPlaceholder extends PureComponent<{ embed: Embed }, {}> {
    render() {
        return (
            <View>
                <Text>{ "Not implemented" }</Text>
            </View>
        );
    }
}
