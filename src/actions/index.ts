import { MikroblogActions } from './mikroblogActions'
import { AddToStateAction } from './entityActions'
import { EntryActions } from './entryActions'

export type RootActions = MikroblogActions | AddToStateAction | EntryActions