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
    }
})