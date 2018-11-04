import Wykop from 'wykop-v2'
import EntriesApi from './entries/EntriesApi';
import secrets from '../../assets/secrets.json'
import { SecureStore } from 'expo'
import { STORAGE_LOGIN, STORAGE_TOKEN } from '../constants';

export default class WykopApi {
    private api: Wykop
    public entries: EntriesApi
    public loggedIn: boolean = false
    
    constructor() {
        this.api = new Wykop(secrets.apiKey, secrets.apiSecret, {
            ssl: true,
            userAgent: 'OWMHybrid',
        })

        this.entries = new EntriesApi(this.api)
        this.loginFromStorage()
    }

    async login(login, token) {
        const data = await this.api.login.normal({
            login,
            accountkey: token,
        })
        this.loggedIn = true
        return data
    }

    async loginFromStorage() {
        const login = await SecureStore.getItemAsync(STORAGE_LOGIN)
        const token = await SecureStore.getItemAsync(STORAGE_TOKEN)


        if (login && token) {
            const data = await this.api.login.normal({
                login,
                accountkey: token,
            })
            this.loggedIn = true
        }
    }
}