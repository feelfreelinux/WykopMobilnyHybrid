
import Wykop from 'wykop-v2'
import { entriesSchema } from '../../models/Schema'
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
}