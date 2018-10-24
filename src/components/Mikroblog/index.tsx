import React, { Component } from 'react'
import styled from 'styled-components/native'
import { Entry } from '../../models'
import { FlatList } from 'react-native'
import EntryComponent from '../Entry'

export default class Messages extends Component<{ getHotEntries: (page: number) => any, entries: Entry[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries(0)
    }
    renderEntry = (entry: Entry) => (
        <EntryComponent entry={entry} />
    );

    render() {
        return (
            <FlatList
                keyExtractor={(entry, index) => entry.id.toString()}
                data={this.props.entries}
                renderItem={(entry) => <EntryComponent entry={entry.item} />}
            />
        )
    }
}
