import React, { PureComponent } from 'react'
import { View, FlatList, Text, ActivityIndicator, Dimensions } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import { RecyclerListView, DataProvider, LayoutProvider, BaseItemAnimator } from 'recyclerlistview'
import { getScreenWidth } from '../../utils'

export default class Mikroblog extends PureComponent<{ getHotEntries: (period) => void, entries, loading: boolean, refreshing: boolean, entryIds: string[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries("12")
    }

    animator = new BaseItemAnimator()
    dataProvider = new DataProvider((r1, r2) => {
        return this.props.entries[r1].id !== this.props.entries[this.props.entryIds[r2]].id;
    })

    layoutProvider = new LayoutProvider(() => 'entry', (_, dim, index) => {
        dim.width = getScreenWidth()
        if(this.props.entries[this.props.entryIds[index]].embed) {
            dim.height = 420
        } else {
            dim.height = 190
        }
    })

    _renderItem = (item) => {
        return (<EntryContainer entryId={item.item} />)
    }

    render() {
        if (this.props.entryIds.length > 0) {
        return (
        /*<View style={{ flex: 1, minHeight: 1, minWidth: 1 }}>
            <RecyclerListView
                onEndReached={() => { this.props.getHotEntries("12") }}
                dataProvider={this.dataProvider.cloneWithRows(this.props.entryIds)}
                layoutProvider={this.layoutProvider}
                forceNonDeterministicRendering={true}
                itemAnimator={this.animator}
                renderAheadOffset={1000}
                canChangeSize={true}
                renderFooter={this._renderFooter}
                rowRenderer={(type, data) => <EntryContainer entryId={data} />}
            /></View>)*/
<FlatList
                keyExtractor={(entryId) => entryId.toString()}
                data={this.props.entryIds}
                refreshing={this.props.refreshing}
                onRefresh={() => {}}
                windowSize={Dimensions.get('window').height*2}
                initialNumToRender={4}
                maxToRenderPerBatch={8}
                onEndReachedThreshold={3}
                removeClippedSubviews={true}
                onEndReached={() => { this.props.getHotEntries("12") }}
                renderItem={this._renderItem}
        />             )   
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
