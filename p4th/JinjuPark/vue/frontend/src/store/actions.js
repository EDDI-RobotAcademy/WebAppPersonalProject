import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING,
    REQUEST_DIARY_BOARD_FROM_SPRING,
    REQUEST_LOGIN_USER_FROM_SPRING,
   THUMB_STATUS_COUNT,
    REQUEST_COMMENT_LIST_FROM_SPRING,
    VIDEOS, MY_SAVE_VIDEOS_LIST,
    REQUEST_IMAGES_FROM_SPRING
} from './mutation-types'

import axios from 'axios'

export default {

    requestDiaryBoardListFromSpring ({ commit }, payload) {
        const pageNo = payload.pageNo
        const keyword = payload.keyword
        let url = `http://localhost:7777/hometwang/boards/diary/list/${pageNo}`
        if(keyword != undefined){
            url += '?keyword='+encodeURIComponent(keyword)
        }
        return axios.get(url)
            .then((res) => {
                commit(REQUEST_DIARY_BOARD_LIST_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestMyDiaryBoardListFromSpring ({ commit }, memberId) {
        return axios.get(`http://localhost:7777/hometwang/boards/diary/mylist/${memberId}`)
            .then((res) => {
                commit(REQUEST_DIARY_BOARD_LIST_FROM_SPRING, res.data)
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestCreateDiaryBoardContentsToSpring ({ }, payload) {
        const { title, category, authority, content, writerToken} = payload
        return axios.post('http://localhost:7777/hometwang/boards/diary/register',
            { title, category, authority, content, writerToken})
            .then(() => {
                alert('게시물 등록에 성공했습니다.')
            })
    },

    requestLoginUserFromSpring({commit}, payload) {
        return axios.post('http://localhost:7777/hometwang/member/login-user', payload)
            .then((res) => {
                commit(REQUEST_LOGIN_USER_FROM_SPRING, res.data)
            })
    },

    requestDiaryBoardFromSpring ({ commit }, boardNo) {
        return axios.get(`http://localhost:7777/hometwang/boards/diary/${boardNo}`)
            .then((res) => {
                commit(REQUEST_DIARY_BOARD_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestDiaryBoardModifyToSpring ({ }, payload) {
        const {  boardNo, title, content } = payload

        return axios.put(`http://localhost:7777/hometwang/boards/diary/${boardNo}`,
            {  boardNo, title, content })
            .then(() => {
                alert('게시글 수정을 완료했습니다.')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestDeleteDiaryBoardToSpring ({ }, boardNo) {
        return axios.delete(`http://localhost:7777/hometwang/boards/diary/${boardNo}`)
            .then(() => {
                alert('게시글 삭제를 완료했습니다.')
            })
    },

    requestThumbStatusToSpring({commit}, payload) {
        const{ memberId, boardNo, thumbType} = payload
        return axios.post('http://localhost:7777/hometwang/boards/diary/recommend', payload)
            .then((res) => {
                commit(THUMB_STATUS_COUNT, res.data)
            })


    },

    requestThumbCheckToSpring({commit}, boardNo) {
        return axios.get(`http://localhost:7777/hometwang/boards/diary/recommend/${boardNo}`)
            .then((res) => {
                commit(THUMB_STATUS_COUNT, res.data)
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestCreateDiaryBoardCommentToSpring ({ }, payload) {
        return axios.post('http://localhost:7777/hometwang/boards/diary/comment/register', payload)
            .then(() => {
                alert('댓글이 등록되었습니다.')
            })
    },

    requestCommentListFromSpring ({ commit }, boardNo) {
        return axios.get(`http://localhost:7777/hometwang/boards/diary/comment/${boardNo}`)
            .then((res) => {
                commit(REQUEST_COMMENT_LIST_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestModifyDiaryBoardCommentToSpring ({ }, payload) {
        return axios.put(`http://localhost:7777/hometwang/boards/diary/comment/${payload.commentId}`,
            {id: payload.commentId, boardNo: payload.boardNo, writerId: payload.writerId,
                writerNickname: payload.writerNickname, parentsCommentId: payload.parentsCommentId , content: payload.updateContent})
            .then(() => {
                alert('댓글이 수정되었습니다')
            })

    },
    // eslint-disable-next-line no-empty-pattern
    requestDeleteCommentBoardToSpring({}, payload) {
        const id = payload.valueOf().commentId
        return axios.post(`http://localhost:7777/hometwang/boards/diary/comment/delete`, {id})
            .then(() => {
                alert('댓글을 삭제했습니다.')
            })
    },

    requestVideoListFromSpring({commit}) {
        return axios.get('http://localhost:7777/hometwang/videos/list')
            .then((res) => {
                commit(VIDEOS, res.data)
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestSaveMyVideoFromSpring({}, payload) {
        const memberId = payload.memberId
        const videoId = payload.videoId

        return axios.post('http://localhost:7777/hometwang/videos/mysave', {memberId, videoId})
            .then((res) => {
                alert(res.data)
            })
    },

    requestMySaveVideoListFromSpring({commit}, payload) {
            const memberId = payload
            return axios.post('http://localhost:7777/hometwang/videos/mysave/list', {memberId})
                .then((res) => {
                    commit(MY_SAVE_VIDEOS_LIST, res.data)
                })
        },
    // eslint-disable-next-line no-empty-pattern
    requestImageReadFromSpring ({ commit }, boardNo) {

        return axios.get(`http://localhost:7777/hometwang/boards/diary/images/${boardNo}`)
            .then((res) => {
                commit(REQUEST_IMAGES_FROM_SPRING, res.data)
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestModifyNickNameToSpring ({}, payload) {
        return axios.post(`http://localhost:7777/hometwang/member/modify-info/`,
            {memberId: payload.memberId, reNickName: payload.reNickName})
            .then((res) => {
               alert(res.data)
            })

    },
}