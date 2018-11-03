import React, { PureComponent } from 'react'
import { FlatList } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import EntryCommentContainer from '../../containers/EntryCommentContainer'

export default class EntryDetails extends PureComponent<{ navigation, getEntryComments: (id) => any, entries, entryComments, commentIds: string[] }, {}> {
    _entryId: number
    
    constructor(props) {
        super(props)
        this._entryId = this.props.navigation.getParam('entryId', '-1')
    }

    componentDidMount() {
        this.props.getEntryComments(this._entryId)
    }

    _renderItem = (item) => {
        if (item.index === 0) {
            return (<EntryContainer entryId={item.item}/>)
        } else {
            return(<EntryCommentContainer commentId={item.item}/>)
        }
    }

    render() {
        return (
            <FlatList
                keyExtractor={(entryId, _) => entryId.toString()}
                data={[this._entryId, ...this.props.commentIds]}
                windowSize={41}
                initialNumToRender={6}
                maxToRenderPerBatch={4}
                updateCellsBatchingPeriod={25}
                renderItem={this._renderItem}
            />
        )
    }
}
