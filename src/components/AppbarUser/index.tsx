import React, { PureComponent } from 'react'
import { Text, Image, View, TouchableOpacity } from 'react-native'
import { withNavigation } from 'react-navigation';

class AppbarUser extends PureComponent<{ navigation, avatarUrl: string }, {}> {
    render() {
        return (
            <TouchableOpacity onPress={ this._openLoginScreen }style={{ marginLeft: 14 }}>
                <Image source={{ uri: this.props.avatarUrl }} style={{ height: 28, width: 28, borderRadius: 40 }} />
            </TouchableOpacity>
        )
    }

    _openLoginScreen = () => {
        this.props.navigation.navigate('LoginScreen')
    }
}

export default withNavigation(AppbarUser)