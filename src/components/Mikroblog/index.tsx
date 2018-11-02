import React, { PureComponent } from 'react'
import styled from 'styled-components/native'
import { Entry } from '../../models'
import { FlatList, Text, ActivityIndicator } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import { OptimizedFlatList } from 'react-native-optimized-flatlist'

export default class Mikroblog extends PureComponent<{ getHotEntries: (period) => any, loading: boolean, refreshing: boolean, entryIds: string[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries("12")
    }

    _renderItem = (item) => {
        if (item.index === this.props.entryIds.length) {
            return (<ActivityIndicator size="large" color="#0000ff"/>)
        } else {
            return (<EntryContainer entryId={item.item}/>)
        }
    }

    render() {
        return (
            <FlatList
                keyExtractor={(entryId) => entryId}
                data={this._getEntries()}
                refreshing={this.props.refreshing}
                onRefresh={() => {}}
                windowSize={41}
                initialNumToRender={16}
                maxToRenderPerBatch={4}
                onEndReachedThreshold={3}
                removeClippedSubviews={true}
                onEndReached={() => { this.props.getHotEntries("12") }}
                renderItem={this._renderItem}
            />
        )
    }

    _getEntries() {
        if (this.props.loading) {
            return [...this.props.entryIds, "loading"]
        } else return this.props.entryIds
    }
}
