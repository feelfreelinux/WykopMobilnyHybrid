import EStyleSheet from 'react-native-extended-stylesheet'

export const marginedIconStyle = (margin) => {
    return EStyleSheet.create({
        iconsStyle: {
            fontSize: 20,
            marginTop: margin,
            color: '$buttonsBarItemsColor'
          }
    })
}

export const marginedWrapperStyle = (padding) => {
    return EStyleSheet.create({
        buttonWrapperStyle: {
            padding,
            height: 30,
            flex: 0,
            flexDirection: 'row',
            alignSelf: 'center',
            alignItems: 'center',
        }
    })
}

export default EStyleSheet.create({

  textStyle: {
    marginLeft: 4,
    fontSize: 16,
    color: '$buttonsBarItemsColor'
  },
});
