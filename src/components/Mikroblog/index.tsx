import React, { PureComponent } from 'react'
import { View, FlatList, Text, ActivityIndicator, Dimensions } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import { RecyclerListView, DataProvider, LayoutProvider } from 'recyclerlistview'

export default class Mikroblog extends PureComponent<{ getHotEntries: (period) => void, loading: boolean, refreshing: boolean, entryIds: string[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries("12")
    }

    dataProvider = new DataProvider((r1, r2) => {
        return r1 !== r2;
    })

    layoutProvider = new LayoutProvider(() => 'VSEL', (type, dim, index) => { dim.width = Math.round(Dimensions.get('window').width * 1000) / 1000 - 6; dim.height = 700 })
    _renderItem = (item) => {
        if (item.index === this.props.entryIds.length) {
            return (<ActivityIndicator size="large" color="#0000ff" />)
        } else {
            return (<EntryContainer entryId={item.item} />)
        }
    }

    render() {
        return (<View style={{ flex: 1, minHeight: 1, minWidth: 1 }}>
            <RecyclerListView
                onEndReached={() => { this.props.getHotEntries("12") }}
                dataProvider={this.dataProvider.cloneWithRows(this.props.entryIds)}
                layoutProvider={this.layoutProvider}
                forceNonDeterministicRendering={true}
                rowRenderer={(type, data) => <EntryContainer entryId={data} />}
            /></View>)
    }

    _getEntries() {
        if (this.props.loading) {
            return [...this.props.entryIds, "loading"]
        } else return this.props.entryIds
    }
}
