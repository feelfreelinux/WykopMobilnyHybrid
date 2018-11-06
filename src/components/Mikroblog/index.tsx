import React, { PureComponent } from 'react'
import EntryList from '../EntryList';

export default class Mikroblog extends PureComponent<{ getHotEntries: (period, refresh) => void, entries, loading: boolean, refreshing: boolean, entryIds: string[] }, {}> {
    componentDidMount() {
        this.props.getHotEntries("12", true)
    }

    render() {
        return (
            <EntryList
                loadEntries={(refresh) => this.props.getHotEntries("12", refresh)}
                refreshing={this.props.refreshing}
                loading={this.props.loading}
                entryIds={this.props.entryIds} />)

    }
}
