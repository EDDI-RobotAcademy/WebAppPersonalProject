import {REQUEST_LOGIN_FROM_SPRING} from './mutation-types'

export default {

    [REQUEST_LOGIN_FROM_SPRING] (state, passingData) {
        state.isAuthenticated = passingData
    }

}