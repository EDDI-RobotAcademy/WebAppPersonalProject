import{
    CHECK_DUPLICATE_EMAIL_TO_SPRING,
    REQUEST_CURRENT_USER_NICKNAME_FROM_SPRING,
    CHECK_DUPLICATE_NICKNAME_TO_SPRING,
    GET_BUCKET_LIST_TO_SPRING,
    REQUEST_BUCKET_FROM_SPRING,
    DOWN_LOAD_IMG_FILE_TO_SPRING,
    GET_CURRENT_BUCKET_LIST_CATEGORY,
    REQUEST_MY_BUCKET_LIST_TO_SPRING,
    REQUEST_SEARCH_BUCKET_LIST_TO_SPRING,
    REQUEST_ALL_BUCKET_LIST_TOTAL_PAGE_FROM_SPRING
} from "./mutation-types"

export default {
    [CHECK_DUPLICATE_EMAIL_TO_SPRING](state, passingData) {
        state.emailPassValue = passingData
    },
    [CHECK_DUPLICATE_NICKNAME_TO_SPRING](state, passingData) {
        state.nicknamePassValue = passingData;
    },
    [REQUEST_CURRENT_USER_NICKNAME_FROM_SPRING](state, passingData) {
        state.currentUserNickname = passingData;
    },
    [GET_BUCKET_LIST_TO_SPRING](state, passingData) {
        state.bucketList = passingData
    },
    [REQUEST_BUCKET_FROM_SPRING](state, passingData){
        state.bucket = passingData
    },
    [DOWN_LOAD_IMG_FILE_TO_SPRING](state, passingData) {
        state.downLoadImgFile = passingData;
    },
    [GET_CURRENT_BUCKET_LIST_CATEGORY](state, passingData) {
        state.currentCategoryBucketList = passingData
    },
    [REQUEST_MY_BUCKET_LIST_TO_SPRING](state, passingData) {
        state.bucketListByNickname = passingData
    },
    [REQUEST_SEARCH_BUCKET_LIST_TO_SPRING](state, passingData) {
        state.searchedBucketList = passingData
    },
    [REQUEST_ALL_BUCKET_LIST_TOTAL_PAGE_FROM_SPRING](state, passingData) {
        state.allBucketListTotalPageValue = passingData;
    },
}