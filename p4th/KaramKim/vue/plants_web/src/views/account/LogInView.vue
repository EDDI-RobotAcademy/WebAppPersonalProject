<template>
  <div>
    <log-in-form @submit="onSubmit"/>
  </div>
</template>

<script>
import LogInForm from "@/components/account/LogInForm";
export default {
  name: "LogInView",
  components: {
    LogInForm
  },
  methods: {

  }
}
</script>

<style scoped>

</style>