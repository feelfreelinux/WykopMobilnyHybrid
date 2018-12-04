import { Middleware } from "redux"

export const MikroblogMiddleware: Middleware = store => next => action => {
    switch (action.type) {
    }
    return next(action)
}