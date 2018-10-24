import React, { Component } from 'react'
import styled from 'styled-components/native'
import { Entry } from '../../models'
import { Text, Image } from 'react-native'
import HTML from 'react-native-render-html';

const EntryText = styled.View`
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 5px;
      margin-top: 2px;
      margin-bottom: 2px;
      background-color: #f5f5f5;
`

const Embed = styled.Image`
      height: 300px;
      width: 100%;
`
export default class EntryComponent extends Component<{ entry: Entry }, {}> {
  render() {
    if (this.props.entry.embed != null) {
      return (
        <EntryText>
            <HTML html={ this.props.entry.body }/>
            <Embed source={{ uri: this.props.entry.embed.preview }}/>
        </EntryText>
      )
    }
    return (
        <EntryText>
            <HTML html={ this.props.entry.body }/>
        </EntryText>
      )
  }
}
