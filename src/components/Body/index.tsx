import React, { Component } from 'react'
import { Embed } from '../../models'
import { Text, Image, View } from 'react-native'
import styles from './styles'
import HTML from 'react-native-render-html';

export default class BodyComponent extends Component<{ body: string }, {}> {
    render() {
        if (this.props.body != null) {
            return (
                <View style={styles.containerStyle}>
                    <HTML html={ this.props.body === null ? '' : this.props.body  }/>
                </View>
            );
        } else {
            return (
                <View/>
            );
        }
    }
}
