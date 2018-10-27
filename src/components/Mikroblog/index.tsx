import React, { PureComponent } from 'react'
import styled from 'styled-components/native'
import { Entry } from '../../models'
import { FlatList } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'

export default class Messages extends PureComponent<{ getHotEntries: (period) => any, refreshing: boolean, entryIds: string[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries("12")
    }

    render() {
        console.log(this.props.entryIds)
        return (
            <FlatList
                keyExtractor={(entryId, _) => entryId.toString()}
                data={this.props.entryIds}
                refreshing={this.props.refreshing}
                onRefresh={() => {}}
                initialNumToRender={8}
                maxToRenderPerBatch={2}
                onEndReachedThreshold={0.5}
                onEndReached={() => { this.props.getHotEntries("12") }}
                renderItem={(entry) => <EntryContainer entryId={entry.item}/>}
            />
        )
    }
}
