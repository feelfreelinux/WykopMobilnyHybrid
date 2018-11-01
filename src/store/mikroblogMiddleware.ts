import { Middleware } from "redux"
import { EntitesActions, ADD_TO_STATE, AddToStateAction } from '../actions/entityActions'
import { SetEntries, SET_ENTRIES, SET_REFRESHING, SET_HAS_REACHED_END } from '../actions/mikroblogActions'
import { normalize, schema } from 'normalizr'
import { entriesSchema, entrySchema } from '../models/Schema'
import { SET_ENTRY_COMMENTS } from "../actions/entryActions"
const camelCaseKeys = require('camelcase-keys')

export const MikroblogMiddleware: Middleware = store => next => action => {
    switch (action.type) {
        case 'GET_HOT_ENTRIES': {
            if (!store.getState().mikroblog.refreshing && !store.getState().mikroblog.hasReachedEnd) {
            store.dispatch({ type: SET_REFRESHING, payload: { refreshing: true } });
                fetch(`http://a2.wykop.pl/entries/hot/period/12/page/${store.getState().mikroblog.page.toString()}/appkey/aNd401dAPp`, {
                    method: 'GET',
                }).then(async (el) => {
                    const data = await el.json()
                    const normalized = (normalize(camelCaseKeys(data.data), entriesSchema))
                    if (data.data.length === 0) {
                        store.dispatch({ type: SET_HAS_REACHED_END, payload: { hasReachedEnd: true } });
                    }
                    store.dispatch({ type: ADD_TO_STATE, payload: { entities: normalized.entities } });
                    store.dispatch({ type: SET_ENTRIES, payload: { entryIds: normalized.result } });
                    store.dispatch({ type: SET_REFRESHING, payload: { refreshing: false } });
                })
            }
            break;
        }

        case 'GET_ENTRY_COMMENTS': {
                fetch(`http://a2.wykop.pl/entries/entry/${action.payload.id}/appkey/aNd401dAPp`, {
                    method: 'GET',
                }).then(async (el) => {
                    const data = await el.json()
                    const comments = data.data.comments.map((el) => camelCaseKeys(el))
                    data.data.comments = comments
                    const normalized = (normalize(camelCaseKeys(data.data), entrySchema))
                    store.dispatch({ type: ADD_TO_STATE, payload: { entities: normalized.entities } });
                    store.dispatch({ type: SET_ENTRY_COMMENTS, payload: { commentIds: normalized.entities.entries[action.payload.id].comments} });
                })
            break;
            
        }
    }
    return next(action)
}