import EStyleSheet from 'react-native-extended-stylesheet'

export const getNicknameStyle = (color) => {
    return EStyleSheet.create({
        textStyle: {
            color,
            fontSize: 16,
        }
    })
}

export default EStyleSheet.create({
    containerStyle: {
        flex: 1,
        flexDirection: 'row',
    },
    
    dateStyle: {
        fontSize: 10,
        color: '$authorHeaderDateColor',
    },

    avatarStyle: {
        width: 40,
        height: 40,
    },

    nicknameContainerStyle: {
        marginLeft: 5,
        flex: 1,
        height: 40,
        alignSelf: 'center',
        flexDirection: 'column'
    }
})