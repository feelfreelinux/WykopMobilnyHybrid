import EStyleSheet from 'react-native-extended-stylesheet'

export const iconStyle = (marginTop, marginRight, fontSize) => {
    return EStyleSheet.create({
        iconsStyle: {
            fontSize: fontSize,
            marginTop: marginTop,
            marginRight: marginRight,
            color: '$buttonsBarItemsColor'
        }
    })
}

export const wrapperStyle = (paddingLeft) => {
    return EStyleSheet.create({
        buttonWrapperStyle: {
            paddingLeft: paddingLeft,
            paddingRight: 10,
            height: 34,
            flex: 0,
            flexDirection: 'row',
            alignSelf: 'center',
            alignItems: 'center',
        }
    })
}

export default EStyleSheet.create({
    textStyle: {
        fontSize: 16,
        color: '$buttonsBarItemsColor'
    },
});
