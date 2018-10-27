import { Middleware } from "redux"
import { SetEntries, SET_ENTRIES } from '../actions/mikroblogActions'

export const MikroblogMiddleware: Middleware = store => next => action => {
    switch (action.type) {
        case 'GET_HOT_ENTRIES': {
            fetch('http://a2.wykop.pl/entries/hot/period/6/appkey/aNd401dAPp', {
                method: 'GET',
            }).then(async (el) => {
                const data = await el.json()
                store.dispatch({ type: SET_ENTRIES, payload: { entries: data.data } });
            })
        }
    }
    return next(action)
}