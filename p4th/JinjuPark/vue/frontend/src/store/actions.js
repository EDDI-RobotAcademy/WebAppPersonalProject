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

}