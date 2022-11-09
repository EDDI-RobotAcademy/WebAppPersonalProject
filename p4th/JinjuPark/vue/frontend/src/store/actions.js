import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING
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
                //if payload = category 보내서 가져올때 diary는 diaryBoards애  이런식?
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
                alert('게시물 등록 성공')
            })
    },

    requestLoginUserFromSpring({commit}, payload) {
        console.log("로그인 유저 정보 가져오기")

       // const {} = payload
        return axios.post('http://localhost:7777/hometwang/member/login-user', payload)
            .then((res) => {
                commit(REQUEST_LOGIN_USER_FROM_SPRING, res.data)
                console.log("로그인한 회원정보 가져옴: " + res.data)
            })
    },
}