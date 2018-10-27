import React, { Component } from 'react'
import { Author } from '../../models'
import { Text, Image, View } from 'react-native'
import { distanceInWordsToNow } from 'date-fns'
import * as plLocale from 'date-fns/locale/pl'
import styles, { getNicknameStyle } from './styles'
import { getAuthorColor } from '../../utils'

export default class AuthorComponent extends Component<{ author: Author, date: Date }, {}> {
    render() {
        const style = getNicknameStyle(getAuthorColor(this.props.author))
        return (
          <View style={styles.containerStyle}>
            <Image source={{uri: this.props.author.avatar }} style={styles.avatarStyle} />
            <View style={styles.nicknameContainerStyle}>
                <Text style={style.textStyle}>{ this.props.author.login }</Text>
                <Text style={styles.dateStyle}>{ distanceInWordsToNow(this.props.date, { locale: plLocale }) + ' temu' }</Text>
            </View>
          </View>
        );
    }
}
