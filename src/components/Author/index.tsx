import React, { Component } from 'react'
import { Author } from '../../models'
import { Text, Image, View } from 'react-native'
import { distanceInWordsToNow } from 'date-fns'
import * as plLocale from 'date-fns/locale/pl'
import styles, { getNicknameStyle, getAuthorSexStyle } from './styles'
import { getAuthorColor, getAuthorSex } from '../../utils'

export default class AuthorComponent extends Component<{ author: Author, date: Date }, {}> {
    render() {
        const stylesAuthorColor = getNicknameStyle(getAuthorColor(this.props.author))
        const stylesAuthorSex = getAuthorSexStyle(getAuthorSex(this.props.author))
        return (
          <View style={styles.containerStyle}>
            <View style={styles.avatarContainerStyle}>
                <Image source={{uri: this.props.author.avatar }} style={styles.avatarStyle} />
                <View style={stylesAuthorSex.viewStyle}></View>
            </View>
            <View style={styles.nicknameContainerStyle}>
                <Text style={stylesAuthorColor.textStyle}>{ this.props.author.login }</Text>
                <Text style={styles.dateStyle}>{ distanceInWordsToNow(this.props.date, { addSuffix: true, locale: plLocale }) }</Text>
            </View>
          </View>
        );
    }
}