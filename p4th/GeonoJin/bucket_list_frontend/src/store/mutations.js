import{
    CHECK_DUPLICATE_EMAIL_TO_SPRING
} from "./mutation-types"

export default {
    [CHECK_DUPLICATE_EMAIL_TO_SPRING](state, passingData) {
        state.emailPassValue = passingData
    },
}