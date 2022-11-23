import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING,
    REQUEST_DIARY_BOARD_FROM_SPRING,
    REQUEST_LOGIN_USER_FROM_SPRING,
   THUMB_STATUS_COUNT,
    REQUEST_COMMENT_LIST_FROM_SPRING,
    VIDEOS,
} from './mutation-types'

import axios from 'axios'

export default {

    requestDiaryBoardListFromSpring ({ commit }, payload) {
        // pageNo = 0(전체), 1(운동일기), 2(자유게시판), 3(질문게시판)
        const pageNo = payload.pageNo
        const keyword = payload.keyword
        console.log('게시판 리스트 조회 페이지No: ' +pageNo +"키워드: "+ keyword)
        let url = `http://localhost:7777/hometwang/boards/diary/list/${pageNo}`
        if(keyword != undefined){
            url += '?keyword='+encodeURIComponent(keyword)
        }
        return axios.get(url)
            .then((res) => {
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

        const {  boardNo, title, content } = payload

        return axios.put(`http://localhost:7777/hometwang/boards/diary/${boardNo}`,
            {  boardNo, title, content })
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

    // eslint-disable-next-line no-empty-pattern
    requestCreateDiaryBoardCommentToSpring ({ }, payload) {
        return axios.post('http://localhost:7777/hometwang/boards/diary/comment/register', payload)
            .then(() => {
                alert('댓글이 등록되었습니다.')
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestCommentListFromSpring ({ commit }, boardNo) {
        console.log('다이어리 댓글 읽기()')

        return axios.get(`http://localhost:7777/hometwang/boards/diary/comment/${boardNo}`)
            .then((res) => {
                commit(REQUEST_COMMENT_LIST_FROM_SPRING, res.data)
                console.log("댓글 res.data: "+ res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestModifyDiaryBoardCommentToSpring ({ }, payload) {
        return axios.put(`http://localhost:7777/hometwang/boards/diary/comment/${payload.commentId}`,
            {id: payload.commentId, boardNo: payload.boardNo, writerId: payload.writerId,
                writerNickname: payload.writerNickname, parentsCommentId: payload.parentsCommentId , content: payload.updateContent})
            .then(() => {
                alert('댓글이 수정되었습니다')
                console.log('다이어리 댓글 수정() 액션 board_id: '+payload.boardNo)
            })

    },
    // eslint-disable-next-line no-empty-pattern
    requestDeleteCommentBoardToSpring({}, payload) {
        const id = payload.valueOf().commentId
        console.log('다이어리 댓글 삭제 번호():'+id)

        return axios.post(`http://localhost:7777/hometwang/boards/diary/comment/delete`, {id})
            .then(() => {
                alert('댓글을 삭제했습니다.')
            })
    },

    requestVideoListFromSpring({commit}) {
        console.log("비디오목록 받아오기()")

        return axios.get('http://localhost:7777/hometwang/videos/list')
            .then((res) => {
                commit(VIDEOS, res.data)
            })
    },

}