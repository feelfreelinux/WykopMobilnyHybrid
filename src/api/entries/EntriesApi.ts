
import Wykop from 'wykop-v2'
import { entriesSchema, entrySchema } from '../../models/Schema'
import { normalize, schema } from 'normalizr'
const camelCaseKeys = require('camelcase-keys')

export default class EntriesApi {
    constructor(public api: Wykop) {
    }

    getHotEntries = async (period: string, page: number) => {
        const hotEntries = await this.api.request(['entries', 'hot'], {
            named: {
                page,
                period,
                output: 'clear',
            }
        })
        const normalized = (normalize(camelCaseKeys(hotEntries), entriesSchema))
        return normalized
    }

    getEntry = async (entryId: string) => {
        const entry = await this.api.request(['entries', 'entry'], {
            named: { output: 'clear' },
            api: [entryId]
        })
        const comments = entry.comments.map((el) => camelCaseKeys(el))
        entry.comments = comments
        return (normalize(camelCaseKeys(entry), entrySchema))
    }
}