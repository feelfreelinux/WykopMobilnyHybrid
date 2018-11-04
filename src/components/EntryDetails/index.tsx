import React, { PureComponent } from 'react'
import { View, Dimensions } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import EntryCommentContainer from '../../containers/EntryCommentContainer'
import { RecyclerListView, DataProvider, LayoutProvider } from 'recyclerlistview';

export default class EntryDetails extends PureComponent<{ navigation, getEntryComments: (id) => any, entries, entryComments, commentIds: string[] }, {}> {
    _entryId: number
    dataProvider = new DataProvider((r1, r2) => {
        return r1 !== r2;
    })

    layoutProvider = new LayoutProvider((index) => index == 0 ? 'entry' : 'comment', (type, dim, index) => {
        if (type == 'entry') {
            dim.height = 700
        } else {
            dim.height = 200
        }
        dim.width = Math.round(Dimensions.get('window').width * 1000) / 1000 - 6;
    
    })
    
    constructor(props) {
        super(props)
        this._entryId = this.props.navigation.getParam('entryId', '-1')
    }

    componentDidMount() {
        this.props.getEntryComments(this._entryId)
    }

    _renderItem = (type, data) => {
        if (type === 'entry') {
            return (<EntryContainer entryId={data}/>)
        } else {
            return(<EntryCommentContainer commentId={data}/>)
        }
    }

    render() {
        return (<View style={{ flex: 1, minHeight: 1, minWidth: 1 }}>
            <RecyclerListView
                dataProvider={this.dataProvider.cloneWithRows([this._entryId, ...this.props.commentIds])}
                layoutProvider={this.layoutProvider}
                forceNonDeterministicRendering={true}
                rowRenderer={this._renderItem}
            /></View>)
    }
}
