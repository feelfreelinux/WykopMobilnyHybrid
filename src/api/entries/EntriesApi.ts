
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
            }
        })
        const normalized = (normalize(camelCaseKeys(hotEntries), entriesSchema))
        return normalized
    }
    
    getActiveEntries = async (page: number) => {
        const hotEntries = await this.api.request(['entries', 'active'], {
            named: {
                page,
            }
        })
        const normalized = (normalize(camelCaseKeys(hotEntries), entriesSchema))
        return normalized
    }

    getStreamEntries = async (page: number) => {
        const hotEntries = await this.api.request(['entries', 'stream'], {
            named: {
                page,
            }
        })
        const normalized = (normalize(camelCaseKeys(hotEntries), entriesSchema))
        return normalized
    }
    
    getEntry = async (entryId: string) => {
        const entry = await this.api.request(['entries', 'entry'], {
            api: [entryId]
        })
        const comments = entry.comments.map((el) => camelCaseKeys(el))
        entry.comments = comments
        return (normalize(camelCaseKeys(entry), entrySchema))
    }
}