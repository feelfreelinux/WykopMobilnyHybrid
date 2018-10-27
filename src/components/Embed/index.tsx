import React, { PureComponent } from 'react'
import { Embed } from '../../models'
import { Image, View } from 'react-native'
import styles from './styles'

export default class EmbedComponent extends PureComponent<{ embed: Embed }, {}> {
    render() {
        return (
            <View style={styles.containerStyle}>
                <Image source={{uri: this.props.embed.preview }} style={styles.imageStyle} />
            </View>
        );
    }
}
