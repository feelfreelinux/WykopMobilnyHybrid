import EStyleSheet from 'react-native-extended-stylesheet'

export const sizedImageStyle = (height, width) => {
    return EStyleSheet.create({
        imageStyle: {
            width,
            height,
        }
    })
}

export default EStyleSheet.create({
    containerStyle: {
        marginTop: 10,
    },
    imageStyle: {
        width: '100%',
        height: 300,
    },
    textStyle: {
        fontSize: 11,
        padding: 3,
        textAlign: 'center',
        width: '100%',
        backgroundColor: '#f0f0f0aa',
        position: 'absolute',
        bottom: 0,
        left: 0,
        textShadowColor: '#ffffff',
        textShadowOffset: { width: 0.5, height: 0.5 },
        textShadowRadius: 1,
    }
})