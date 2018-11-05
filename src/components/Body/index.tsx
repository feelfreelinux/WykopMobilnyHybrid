import React, { PureComponent } from 'react'
import { View, Text } from 'react-native'
import styles from './styles'
import HTML from 'react-native-render-html';

export default class BodyComponent extends PureComponent<{ body: string }, {}> {
    render() {
        if (this.props.body != null) {
            return (
                <View style={styles.containerStyle}>
                    <Text numberOfLines={6}>{ this.props.body }</Text>
                </View>
            )
        } else {
            return (
                <View/>
            )
        }
    }
}
