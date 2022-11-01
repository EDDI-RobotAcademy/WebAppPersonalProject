import {REQUEST_EMAIL_PASS_CHECK, } from './mutation-types'

export default {

    [REQUEST_EMAIL_PASS_CHECK] (state, passingData) {
        state.unDuplicateEmailPass = passingData
    },

}