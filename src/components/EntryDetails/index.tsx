import React, { PureComponent } from 'react'
import { View, Dimensions, FlatList, ActivityIndicator } from 'react-native'
import EntryContainer from '../../containers/EntryContainer'
import EntryCommentContainer from '../../containers/EntryCommentContainer'
import { RecyclerListView, DataProvider, LayoutProvider, BaseItemAnimator } from 'recyclerlistview';
import { getScreenWidth } from '../../utils';

export default class EntryDetails extends PureComponent<{ navigation, getEntryComments: (id) => any, entries, entryComments, commentIds: string[] }, {}> {
    _entryId: number
    
    constructor(props) {
        super(props)
        this._entryId = this.props.navigation.getParam('entryId', '-1')
    }

    componentDidMount() {
        this.props.getEntryComments(this._entryId)
    }

    _renderItem = (data) => {
        if (data.index === 0) {
            return (<EntryContainer entryId={data.item}/>)
        }
        return(<EntryCommentContainer commentId={data.item}/>)
    }

    render() {
        if (this.props.commentIds.length > 0) {
        return (
<FlatList
                keyExtractor={(entryId) => entryId.toString()}
                data={[this._entryId, ...this.props.commentIds]}
                windowSize={Dimensions.get('window').height*2}
                initialNumToRender={8}
                maxToRenderPerBatch={16}
                removeClippedSubviews={true}
                renderItem={this._renderItem}
        />             )}
        else {
            return (<View style={{flex:1, alignItems: 'center', alignContent: 'center'}}><ActivityIndicator size="large" color="#0000ff" /></View>)
        }
    }
}
