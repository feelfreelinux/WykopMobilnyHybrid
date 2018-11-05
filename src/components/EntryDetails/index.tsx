import React, { PureComponent } from 'react'
import { View, Dimensions } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import EntryCommentContainer from '../../containers/EntryCommentContainer'
import { RecyclerListView, DataProvider, LayoutProvider, BaseItemAnimator } from 'recyclerlistview';
import { getScreenWidth } from '../../utils';

export default class EntryDetails extends PureComponent<{ navigation, getEntryComments: (id) => any, entries, entryComments, commentIds: string[] }, {}> {
    _entryId: number
    dataProvider = new DataProvider((r1, r2) => {
        return r1 !== r2;
    })

    animator = new BaseItemAnimator()
    layoutProvider = new LayoutProvider((index) => index == 0 ? 'entry' : 'comment', (type, dim) => {
        if (type == 'entry') {
            dim.height = 700
        } else {
            dim.height = 200
        }
        dim.width = getScreenWidth()
    
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
                renderAheadOffset={2500}
                disableRecycling={true}
                dataProvider={this.dataProvider.cloneWithRows([this._entryId, ...this.props.commentIds])}
                layoutProvider={this.layoutProvider}
                forceNonDeterministicRendering={true}
                canChangeSize={true}
                initialOffset={1}
                stableIds={true}
                itemAnimator={this.animator}
                rowRenderer={this._renderItem}
            /></View>)
    }
}
