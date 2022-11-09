import {
    REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING

} from './mutation-types'

export default {
    [REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING] (state, passingData) {
        state.checkDuplicateEmail = passingData
    },
}