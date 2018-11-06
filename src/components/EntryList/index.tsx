import React, { PureComponent } from 'react'
import { View, FlatList, ActivityIndicator, Dimensions } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'


export default class EntryList extends PureComponent<{ loadEntries: (refresh: boolean) => void, loading: boolean, refreshing: boolean, entryIds: string[] }, {}> {
    _renderItem = (item) => {
        if (item.index === this.props.entryIds.length) {
            return this._renderFooter()
        }
        return (<EntryContainer entryId={item.item} />)
    }

    render() {
        if (this.props.entryIds.length > 0) {
        return (
            <FlatList
                keyExtractor={(entryId) => entryId.toString()}
                data={[...this.props.entryIds, 'loader']}
                refreshing={this.props.refreshing}
                onRefresh={() => { this.props.loadEntries(true) }}
                windowSize={Dimensions.get('window').height*2}
                initialNumToRender={4}
                maxToRenderPerBatch={8}
                onEndReachedThreshold={3}
                removeClippedSubviews={true}
                onEndReached={() => { this.props.loadEntries(false) }}
                renderItem={this._renderItem}/>)
        } else {
            return (<View/>)
        }
    }

    _renderFooter = () => {
        if (this.props.loading) {
            return (<ActivityIndicator size="large" color="#0000ff" />)
        } else {
            return (<View style={{ height: 10 }}/>)
        }
    }
}
