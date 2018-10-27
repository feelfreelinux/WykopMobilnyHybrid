
 import { schema } from 'normalizr'

export const author = new schema.Entity('authors', {}, { idAttribute: 'login' })
export const entryComment = new schema.Entity('entryComments', {}, { idAttribute: 'id' })
export const entryComments = new schema.Array(entryComment)

export const entrySchema = new schema.Entity('entries', {
    comments: entryComments,
    author,
}, { idAttribute: 'id' })

export const entriesSchema = new schema.Array(entrySchema)