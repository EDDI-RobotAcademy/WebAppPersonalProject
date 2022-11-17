import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING,
    REQUEST_DIARY_BOARD_FROM_SPRING,
    REQUEST_LOGIN_USER_FROM_SPRING,
   THUMB_STATUS_COUNT,
} from './mutation-types'

import axios from 'axios'

export default {

    requestDiaryBoardListFromSpring ({ commit }, keyword) {
        console.log('requestDiaryBoardListFromSpring()')
        let url = 'http://localhost:7777/hometwang/boards/diary/list'
        if(keyword != undefined){
            url += '?keyword='+encodeURIComponent(keyword)
        }
        return axios.get(url)
            .then((res) => {
                //if payload = category 보내서 가져올때 diary는 diaryBoards에  이런식?
                commit(REQUEST_DIARY_BOARD_LIST_FROM_SPRING, res.data)
                console.log('다이어리 리스트 조회')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestCreateDiaryBoardContentsToSpring ({ }, payload) {
        console.log('운동일기 게시물 등록()')

        const { title, category, authority, content, writerToken} = payload
        return axios.post('http://localhost:7777/hometwang/boards/diary/register',
            { title, category, authority, content, writerToken})
            .then(() => {
                alert('게시물 등록에 성공했습니다.')
            })
    },

    requestLoginUserFromSpring({commit}, payload) {
        console.log("로그인 유저 정보 가져오기")

        return axios.post('http://localhost:7777/hometwang/member/login-user', payload)
            .then((res) => {
                commit(REQUEST_LOGIN_USER_FROM_SPRING, res.data)
                console.log("로그인한 회원정보 가져옴: " + res.data)
            })
    },

    requestDiaryBoardFromSpring ({ commit }, boardNo) {
        console.log('다이어리 게시글 정보 읽기()')

        return axios.get(`http://localhost:7777/hometwang/boards/diary/${boardNo}`)
            .then((res) => {
                commit(REQUEST_DIARY_BOARD_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestDiaryBoardModifyToSpring ({ }, payload) {
        console.log('다이어리 게시글 수정()')

        const {  boardNo, title, writer, category, authority, regDate, views, likes, noLikes, content } = payload

        return axios.put(`http://localhost:7777/hometwang/boards/diary/${boardNo}`,
            {  title, writer, category, authority, regDate, views, likes, noLikes, content })
            .then(() => {
                alert('게시글 수정을 완료했습니다.')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestDeleteDiaryBoardToSpring ({ }, boardNo) {
        console.log('다이어리 삭제()')

        return axios.delete(`http://localhost:7777/hometwang/boards/diary/${boardNo}`)
            .then(() => {
                alert('게시글 삭제를 완료했습니다.')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestThumbStatusToSpring({commit}, payload) {

        const{ memberId, boardNo, thumbType} = payload
        console.log("멤버 아이디: "+memberId+"추천/비추천- 게시물 번호"+boardNo + thumbType)

        return axios.post('http://localhost:7777/hometwang/boards/diary/recommend', payload)
            .then((res) => {
                commit(THUMB_STATUS_COUNT, res.data)
                console.log("추천/비추천- 게시글: " + res.data)
            })
    },

}