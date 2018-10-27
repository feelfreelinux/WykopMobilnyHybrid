import { Middleware } from "redux"
import { EntitesActions, ADD_TO_STATE, AddToStateAction } from '../actions/entityActions'
import { SetEntries, SET_ENTRIES } from '../actions/mikroblogActions'
import { normalize, schema } from 'normalizr'
import { entriesSchema } from '../models/Schema'

export const MikroblogMiddleware: Middleware = store => next => action => {
    switch (action.type) {
        case 'GET_HOT_ENTRIES': {
            fetch('http://a2.wykop.pl/entries/hot/period/6/appkey/aNd401dAPp', {
                method: 'GET',
            }).then(async (el) => {
                const data = await el.json()
                const normalized = (normalize(data.data, entriesSchema))
                store.dispatch({ type: ADD_TO_STATE, payload: { entities: normalized.entities } });
                store.dispatch({ type: SET_ENTRIES, payload: { entryIds: normalized.result } });
            })
        }
    }
    return next(action)
}