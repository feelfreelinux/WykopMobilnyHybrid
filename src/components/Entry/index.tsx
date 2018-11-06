import React, { PureComponent } from 'react'
import { Entry } from '../../models'
import { View, TouchableHighlight, TouchableWithoutFeedback, Text } from 'react-native'
import styles from './styles'
import AuthorContainer from '../../containers/AuthorContainer'
import EmbedComponent from '../Embed'
import BodyComponent from '../Body'
import FooterButton from '../FooterButton'
import { withNavigation } from 'react-navigation'
import { navigate } from '../../navigation/NavigationService';

class EntryComponent extends PureComponent<{ navigation, entryId: number, entries }, {}> {
  render() {
    const entry = this.props.entries[this.props.entryId]
    if (entry.embed != null) {
      return (
        <View style={styles.entryStyle} >
          <AuthorContainer date={entry.date} authorId={entry.author} />
          <BodyComponent body={entry.body} />
          <EmbedComponent embed={entry.embed} />
          {this._renderFooter()}
        </View>
      )
    }
    return (
      <View  style={styles.entryStyle} >
        <AuthorContainer date={entry.date} authorId={entry.author} />
        <BodyComponent body={entry.body} />
        {this._renderFooter()}
      </View>
    )
  }

  _openDetails = () => {
    navigate('EntryDetails', {
      entryId: this.props.entryId
    })
  }

  _renderFooter() {
    const entry = this.props.entries[this.props.entryId]
    return (
      <View style={styles.footerStyle}>
        <FooterButton iconName="ic_buttontoolbar_share" iconFontSize={18} />
        <FooterButton iconName="ic_buttontoolbar_favorite" />
        <View style={{ flexGrow: 1 }} />
        <FooterButton iconName="ic_buttontoolbar_comment" onClicked={this._openDetails} iconMarginTop={3} iconMarginRight={5} iconFontSize={18} wrapperPaddingLeft={10} text={entry.commentsCount.toString()} />
        <FooterButton iconName="ic_buttontoolbar_plus" iconMarginTop={1} iconMarginRight={1} iconFontSize={21} wrapperPaddingLeft={6} text={entry.voteCount.toString()} />
        <FooterButton iconName="ic_buttontoolbar_dots" />
      </View>
    )
  }
}

export default withNavigation(EntryComponent)