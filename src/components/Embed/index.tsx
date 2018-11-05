import React, { PureComponent } from 'react'
import { Embed } from '../../models'
import { Image, View, TouchableHighlight, Dimensions, Text } from 'react-native'
import styles, { sizedImageStyle } from './styles'

interface State {
    width: number
    height: number
    isResized: boolean
    isLoaded: boolean
    widthScreen: number
    heightScreen: number
    heightCurled: number
}

export default class EmbedComponent extends PureComponent<{ embed: Embed }, State> {
    constructor(props) {
        super(props)
        this.state = {
            width: 0,
            height: 0,
            isLoaded: false,
            isResized: false,
            widthScreen: Dimensions.get('window').width,
            heightScreen: Dimensions.get('window').height,
            heightCurled: Dimensions.get('window').height / 3,
        }
        Dimensions.addEventListener('change', (e) => {
            const { width, height } = e.window;
            this.setState({
                widthScreen: width,
                heightScreen: height,
                heightCurled: height / 3
            });
        })
        Image.getSize(this.props.embed.preview, this._handleSizeReceived.bind(this), (() => { }).bind(this))
    }

    _handleSizeReceived = (width, height) => {
        // If image is small, we shouldn't display the resize overlay
        if (height * (this.state.widthScreen / width) >= this.state.heightCurled) {
            this.setState({
                width,
                height,
                isLoaded: true,
            })
        } else {
            this.setState({
                width,
                height,
                isLoaded: true,
                isResized: true,
            })
        }
    }

    render() {
        return (
            <View style={styles.containerStyle}>
                {this._renderImage()}
            </View>
        )
    }

    _resizeImage = () => {
        this.setState({
            isResized: true,
        })
    }

    _renderImage() {
        const height = this.state.height * (this.state.widthScreen / this.state.width)
        const style = sizedImageStyle(height, this.state.widthScreen)
        if (this.state.isLoaded && this.state.isResized) {
            return (
                <Image resizeMethod="resize" source={{ uri: this.props.embed.preview }} style={style.imageStyle} />
            )
        } else if (this.state.isLoaded && !this.state.isResized) {
            return (
                <TouchableHighlight onPress={this._resizeImage}>
                    <View style={{ width: this.state.widthScreen, height: this.state.heightCurled, overflow: 'hidden', flex: 1, flexDirection: 'column' }}>
                        <Image resizeMethod="resize" blurRadius={this.props.embed.plus18 ? 10 : 0} source={{ uri: this.props.embed.preview }} style={style.imageStyle} />
                        <Text style={styles.textStyle}>••• pokaż cały obrazek •••</Text>
                    </View>
                </TouchableHighlight>
            )
        } else {
            return (
                <View style={{ height: this.state.heightCurled, width: this.state.widthScreen }} />
            )
        }
    }
}
