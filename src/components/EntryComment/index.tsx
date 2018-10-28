import React, { PureComponent } from 'react'
import { Entry } from '../../models'
import { View, TouchableHighlight, TouchableWithoutFeedback, Text } from 'react-native'
import styles from './styles'
import AuthorContainer from '../../containers/AuthorContainer'
import EmbedComponent from '../Embed'
import BodyComponent from '../Body'
import FooterButton from '../FooterButton'

export default class EntryCommentComponent extends PureComponent<{ commentId: number, entryComments }, {}> {
  render() {
    const comment = this.props.entryComments[this.props.commentId]
    if (comment.embed != null) {
      return (
        <View style={styles.entryStyle} >
          <AuthorContainer date={comment.date} authorId={comment.author} />
          <BodyComponent body={comment.body} />
          <EmbedComponent embed={comment.embed} />
          {this._renderFooter()}
        </View>
      )
    }
    return (
      <View style={styles.entryStyle} >
        <AuthorContainer date={comment.date} authorId={comment.author} />
        <BodyComponent body={comment.body} />
        {this._renderFooter()}
      </View>
    )
  }

  _renderFooter() {
    const comment = this.props.entryComments[this.props.commentId]
    return (
      <View style={styles.footerStyle}>
        <FooterButton iconName="ic_buttontoolbar_share" iconFontSize={18} />
        <FooterButton iconName="ic_buttontoolbar_reply" />
        <FooterButton iconName="ic_buttontoolbar_quote" />
        <View style={{ flexGrow: 1 }} />
        <FooterButton iconName="ic_buttontoolbar_plus" iconMarginTop={1} iconMarginRight={1} iconFontSize={21} wrapperPaddingLeft={6} text={comment.voteCount.toString()} />
        <FooterButton iconName="ic_buttontoolbar_dots" />
      </View>
    )
  }
}
