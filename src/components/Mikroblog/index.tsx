import React, { PureComponent } from 'react'
import styled from 'styled-components/native'
import { Entry } from '../../models'
import { FlatList } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'

export default class Messages extends PureComponent<{ getHotEntries: (page: number) => any, entryIds: string[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries(0)
    }

    render() {
        return (
            <FlatList
                keyExtractor={(entryId, index) => entryId.toString()}
                data={this.props.entryIds}
                renderItem={(entry) => <EntryContainer entryId={entry.item} />}
            />
        )
    }
}
