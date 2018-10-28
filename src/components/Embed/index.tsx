import React, { PureComponent } from 'react'
import { Embed } from '../../models'
import { Image, View, TouchableOpacity } from 'react-native'
import styles, { sizedImageStyle } from './styles'

interface State {
    width: number
    height: number
    isResized: boolean
    isLoaded: boolean
}

export default class EmbedComponent extends PureComponent<{ embed: Embed }, State> {
    constructor(props) {
        super(props)
        this.state = {
            width: 0,
            height: 0,
            isLoaded: false,
            isResized: false,
        }
        Image.getSize(this.props.embed.preview, this._handleSizeReceived, () => {})
    }


    _handleSizeReceived = (width, height) => {
        this.setState({
            width,
            height,
            isLoaded: true,
        })
    }

    render() {
        return (
            <View style={styles.containerStyle}>
                { this._renderImage() }
            </View>
        )
    }

    _resizeImage = () => {
        this.setState({
            isResized: true,
        })
    }

    _renderImage() {
        if (this.state.isLoaded && this.state.isResized) {
            const style = sizedImageStyle(this.state.height, this.state.width)
            return (
                <Image source={{uri: this.props.embed.preview }} style={style.imageStyle} />
            )
        } else if (this.state.isLoaded && !this.state.isResized) {
            const style = sizedImageStyle(300, this.state.width)
            return (
                <TouchableOpacity onPress={this._resizeImage}>
                    <Image source={{uri: this.props.embed.preview }} style={style.imageStyle} />
                </TouchableOpacity>
            )  
        } else {
            return (
                <View  style={{ height: 300, width: '100%' }}/>
            )
        }
    }
}
