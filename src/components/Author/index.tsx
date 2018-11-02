import React, { PureComponent } from 'react'
import { Author } from '../../models'
import { Text, Image, View } from 'react-native'
import { distanceInWordsToNow } from 'date-fns'
import * as plLocale from 'date-fns/locale/pl'
import styles, { getNicknameStyle, getAuthorSexStyle } from './styles'
import { getAuthorColor, getAuthorSex } from '../../utils'

export default class AuthorComponent extends PureComponent<{ authorId: number, date: Date, authors }, {}> {
    render() {
        const author = this.props.authors[this.props.authorId]
        const stylesAuthorColor = getNicknameStyle(getAuthorColor(author))
        const stylesAuthorSex = getAuthorSexStyle(getAuthorSex(author))
        return (
          <View style={styles.containerStyle}>
            <View style={styles.avatarContainerStyle}>
                <Image resizeMethod="resize" source={{uri: author.avatar }} style={styles.avatarStyle} />
                <View style={stylesAuthorSex.viewStyle}></View>
            </View>
            <View style={styles.nicknameContainerStyle}>
                <Text style={stylesAuthorColor.textStyle}>{ author.login }</Text>
                <Text style={styles.dateStyle}>{ distanceInWordsToNow(this.props.date, { addSuffix: true, locale: plLocale }) }</Text>
            </View>
          </View>
        );
    }
}