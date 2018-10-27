import React, { Component } from 'react'
import { View, TouchableOpacity, Text } from 'react-native'
import styles, { iconStyle, wrapperStyle } from './styles'
import { OWMIcons } from '../../../App';

export default class EntryComponent extends Component<{ iconName: string, iconMarginTop: number, iconMarginRight: number, iconFontSize: number, text: string | null, wrapperPaddingLeft: number }, {}> {
    public static defaultProps = {
        text: null,
        iconMarginTop: 0,
        iconMarginRight: 0,
        iconFontSize: 20,
        wrapperPaddingLeft: 10,
    }

    render() {
        const wrapper = wrapperStyle(this.props.wrapperPaddingLeft)
        const icon = iconStyle(this.props.iconMarginTop, this.props.iconMarginRight, this.props.iconFontSize)
        return (
            <TouchableOpacity>
                <View style={wrapper.buttonWrapperStyle}>
                    <OWMIcons name={this.props.iconName} style={icon.iconsStyle} />
                    {this._renderText()}
                </View>
            </TouchableOpacity>
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
