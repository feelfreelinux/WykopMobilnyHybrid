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
            <AuthorComponent date={this.props.entry.date} author={ this.props.entry.author }/>
            <BodyComponent body={ this.props.entry.body }/>
            <EmbedComponent embed={ this.props.entry.embed }/>
            {this._renderFooter()}
        </View>
      )
    }
    return (
        <View style={styles.entryStyle} >
            <AuthorComponent date={ this.props.entry.date } author={ this.props.entry.author }/>
            <BodyComponent body={ this.props.entry.body }/>
            {this._renderFooter()}
        </View>
      )
  }

  _renderFooter() {
    return (
      <View style={styles.footerStyle}>
        <FooterButton ignoreMargin={true} iconName="ic_buttontoolbar_share"/>
        <FooterButton iconName="ic_buttontoolbar_favorite"/>
        <View style={{ flexGrow: 1 }}/>
        <FooterButton text={this.props.entry['comments_count'].toString()} topMarginOveride={3} iconName="ic_buttontoolbar_comment"/>
        <FooterButton text={this.props.entry['vote_count'].toString()} topMarginOveride={2} iconName="ic_buttontoolbar_plus"/>
        <FooterButton ignoreMargin={true} iconName="ic_buttontoolbar_dots"/>
      </View>
    )
  }
}
