import React, { Component } from 'react'
import { Entry } from '../../models'
import { View } from 'react-native'
import styles from './styles'
import AuthorComponent from '../Author';
import EmbedComponent from '../Embed';
import BodyComponent from '../Body'
import { OWMIcons } from '../../../App'

export default class EntryComponent extends Component<{ entry: Entry }, {}> {
  render() {
    if (this.props.entry.embed != null) {
      return (
        <View style={styles.entryStyle} >
            <AuthorComponent date={this.props.entry.date} author={ this.props.entry.author }/>
            <BodyComponent body={ this.props.entry.body }/>
            <EmbedComponent embed={ this.props.entry.embed }/>
        </View>
      )
    }
    return (
        <View style={styles.entryStyle} >
            <AuthorComponent date={ this.props.entry.date } author={ this.props.entry.author }/>
            <BodyComponent body={ this.props.entry.body }/>
        </View>
      )
  }
}
