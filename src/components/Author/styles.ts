import EStyleSheet from 'react-native-extended-stylesheet'

export const getNicknameStyle = (color) => {
    return EStyleSheet.create({
        textStyle: {
            color,
            fontSize: 13,
        }
    })
}

export const getAuthorSexStyle = (sex) => {
    if (sex == null) {
        return EStyleSheet.create({
            viewStyle: {}
        })
    }
    return EStyleSheet.create({
        viewStyle: {
            marginTop: 1,
            width: 32,
            height: 2,
            backgroundColor: sex,
        }
    })
}

export default EStyleSheet.create({
    containerStyle: {
        flex: 1,
        flexDirection: 'row',
        marginTop: 8,
        marginLeft: 12,
        marginRight: 12,
    },

    dateStyle: {
        fontSize: 11,
        color: '$authorHeaderDateColor',
    },

    avatarStyle: {
        width: 32,
        height: 32,
    },

    avatarContainerStyle: {
        alignSelf: 'center',
        flexDirection: 'column'
    },

    nicknameContainerStyle: {
        marginBottom: 2,
        marginLeft: 10,
        alignSelf: 'center',
        flexDirection: 'column',
        justifyContent: 'center',
    }
})