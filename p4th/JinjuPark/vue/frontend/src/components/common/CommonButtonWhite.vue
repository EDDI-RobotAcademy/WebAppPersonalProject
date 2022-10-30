<template>
<!--
1. main.js에서 현재 파일을 글로벌 컴포넌트로 만듦
2. 지금 이 파일이 공동컴포넌트 틀이고, 실제 화면에서 이 컴포넌트 태그를 커스텀해서 사용
-->
<!-- 태그 설명
1. isMobile이 false(즉, 모바일화면이 아닌경우) -> iconName과 btnName 보임
2. 여기서 $listeners는 이벤트 리스너라고 불리며, 인터럽트와 같이 특정 이벤트를 감지할 수 있습니다.
   이벤트 리스너 핸들러는 인터페이스화 되어 있기 때문에 필요에 따라 재정의하여 사용
3. v-bind의 $attrs는 컴포넌트에 전달된 속성을 제어하기 위함

4. 여기서 사용자가 실제 사용하는 veiw단 파일에서 지정하는 값은 {{iconName}}과 {{btnName}}
 -->
<!-- 버튼 색/ 글자 색
 class ="white--text"는 하얀색 글자
 class ="pink"는 버튼 핑크색 , 겅정 글자(기본 적용)
 class ="pink white--text"는 핑크색 버튼에 하얀색 글자  -->
  <v-btn
    class="ma-2"
    color="blue lighten-1"
    outlined
    elevation="2"
    v-on="$listeners"
    v-bind="$attrs"
    v-if="!isMobile()">
   <v-icon small>
     {{iconName}}
   </v-icon>
    <span style="width: 5px" v-if="btnName"></span>
    {{btnName}}
  </v-btn>

<!--
 isMobile이 true(모바일화면인 경우-> 화면사이즈 작음) icon만 보임
 -->
  <v-btn
      class="ma-2"
      color="blue lighten-1"
      outlined
      elevation="2"
      v-on="$listeners"
      v-bind="$attrs"
      v-else>
    <span style="width: 3px" v-if="btnName"></span>
    {{btnName}}
  </v-btn>
</template>

<script>
import commonMixins from '@/mixins/CommonMixins'

//mixins를 통해 isMobile()이 동작하고 휴대폰인지 pc인지를 판정

export default {
  name: "CommonButton",
  mixins: [commonMixins],
  props: {                 //글로벌컴포넌트이지만 속성을 받아야해서 props 써주는 건가?
    iconName: String,
    btnName: String,
  }
}
</script>

<style scoped>

</style>