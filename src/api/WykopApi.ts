import Wykop from 'wykop-v2'
import EntriesApi from './entries/EntriesApi';
import secrets from '../../assets/secrets.json'

export default class WykopApi {
    private api: Wykop
    public entries: EntriesApi
    
    constructor() {
        this.api = new Wykop(secrets.apiKey, secrets.apiSecret, {
            ssl: true,
            userAgent: 'OWMHybrid',
        })

        this.entries = new EntriesApi(this.api)
    }
}