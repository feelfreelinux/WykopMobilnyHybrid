import React, { PureComponent } from 'react'
import EntryList from '../EntryList';

export enum MikroblogPageType {
    HOT_6,
    HOT_12,
    HOT_24,
    ACTIVE,
    NEWEST,
}


interface Props {
    getHotEntries: (period, refresh) => void,
    getActiveEntries: (refresh) => void,
    getNewestEntries: (refresh) => void,

    pageType: MikroblogPageType,
    entries,
    loading: boolean,
    refreshing: boolean,
    entryIds: string[]
}

export default class Mikroblog extends PureComponent<Props, {}> {
    componentDidMount() {
        this._loadData(true)
    }
    render() {
        return (
            <EntryList
                loadEntries={(refresh) => this._loadData(refresh)}
                refreshing={this.props.refreshing}
                loading={this.props.loading}
                entryIds={this.props.entryIds} />)
    }

    _loadData(refresh) {
        console.log(this.props.pageType)
        switch (this.props.pageType) {
            case MikroblogPageType.ACTIVE:
                this.props.getActiveEntries(refresh)
                break
            case MikroblogPageType.NEWEST:
                this.props.getNewestEntries(refresh)
                break
            
            case MikroblogPageType.HOT_6:
                this.props.getHotEntries("6", refresh)
                break
            
            case MikroblogPageType.HOT_12:
                this.props.getHotEntries("12", refresh)
                break
                
            case MikroblogPageType.HOT_24:
                this.props.getHotEntries("24", refresh)
                break
        }
    }
}
