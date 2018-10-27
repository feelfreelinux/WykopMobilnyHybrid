import React, { Component } from 'react'
import { View, TouchableHighlight, TouchableWithoutFeedback, Text } from 'react-native'
import styles, { marginedIconStyle, marginedWrapperStyle } from './styles'
import { OWMIcons } from '../../../App';

export default class EntryComponent extends Component<{ iconName: string, topMarginOveride: number, text: string | null, ignoreMargin: boolean }, {}> {
    public static defaultProps = {
        text: null,
        topMarginOveride: 0,
        ignoreMargin: false
    }

    render() {
        const wrapperStyle = marginedWrapperStyle( this.props.ignoreMargin ? 0 : 6)
        const style = marginedIconStyle(this.props.topMarginOveride)
        return (
            <View style={wrapperStyle.buttonWrapperStyle}>
                <OWMIcons name={this.props.iconName} style={style.iconsStyle} />
                {this._renderText()}
            </View>
        )
    }

    _renderText() {
        if (this.props.text) {
            return (
                <Text style={styles.textStyle}>
                    {this.props.text}
                </Text>)
        } else return (<View />)
    }
}
