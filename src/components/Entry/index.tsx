import React, { Component } from 'react'
import { Entry } from '../../models'
import { View, TouchableHighlight, TouchableWithoutFeedback, Text } from 'react-native'
import styles from './styles'
import AuthorComponent from '../Author'
import EmbedComponent from '../Embed'
import BodyComponent from '../Body'
import FooterButton from '../FooterButton'

export default class EntryComponent extends Component<{ entry: Entry }, {}> {
  render() {
    if (this.props.entry.embed != null) {
      return (
        <View style={styles.entryStyle} >
          <AuthorComponent date={this.props.entry.date} author={this.props.entry.author} />
          <BodyComponent body={this.props.entry.body} />
          <EmbedComponent embed={this.props.entry.embed} />
          {this._renderFooter()}
        </View>
      )
    }
    return (
      <View style={styles.entryStyle} >
        <AuthorComponent date={this.props.entry.date} author={this.props.entry.author} />
        <BodyComponent body={this.props.entry.body} />
        {this._renderFooter()}
      </View>
    )
  }

  _renderFooter() {
    return (
      <View style={styles.footerStyle}>
        <FooterButton iconName="ic_buttontoolbar_share" iconFontSize={18} />
        <FooterButton iconName="ic_buttontoolbar_favorite" />
        <View style={{ flexGrow: 1 }} />
        <FooterButton iconName="ic_buttontoolbar_comment" iconMarginTop={3} iconMarginRight={5} iconFontSize={18} wrapperPaddingLeft={10} text={this.props.entry['comments_count'].toString()} />
        <FooterButton iconName="ic_buttontoolbar_plus" iconMarginTop={1} iconMarginRight={1} iconFontSize={21} wrapperPaddingLeft={6} text={this.props.entry['vote_count'].toString()} />
        <FooterButton iconName="ic_buttontoolbar_dots" />
      </View>
    )
  }
}
