import {REQUEST_EMAIL_PASS_CHECK, REQUEST_LOGGED_IN_USER_PROFILE,} from './mutation-types'

export default {

    [REQUEST_EMAIL_PASS_CHECK] (state, passingData) {
        state.unDuplicateEmailPass = passingData
    },

    [REQUEST_LOGGED_IN_USER_PROFILE] (state, passingData) {
        state.loggedInUserProfile = passingData
    }

}