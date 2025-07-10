<template>
  <BaseStepper
    :title="title"
    :steps="steps"
    @step-changed="handleStepChange"
  />
</template>

<script>
import BaseStepper from '../stepper/BaseStepper.vue'

export default {
  name: 'LoginLogout',
  components: {
    BaseStepper
  },
  data() {
    return {
      title: 'How to Login and Logout',
      steps: [
        {
          title: 'Welcome',
          description: 'Welcome to the City Records Management System or CRMS version 2.',
          image: '/img/welcome.png',
          tip: 'Take your time to understand each step before proceeding to the next one.'
        },
        {
          title: 'Login',
          description: 'To login on your account, type-in your account name and password then click login.',
          image: '/img/login.png',
          tip: 'Make sure to enter your credentials correctly to avoid login issues.'
        },
        {
          title: 'Reminder',
          description: 'If ever you forgot your username and password, contact the City Archives and Records Office and they will gladly assist you.',
          image: '/img/login_fields.png',
          tip: 'Keep your login credentials secure and don\'t share them with others.'
        },
        {
          title: 'Dashboard',
          description: "Welcome to your account's dashboard.",
          image: '/img/dashboard.png',
          tip: 'Explore the dashboard to familiarize yourself with all available features.'
        },
        {
          title: 'Logout',
          description: 'Logging out from your account is easy. Just click your name found on your upper right corner of your screen, and simply click log out.',
          image: '/img/logout.png',
          tip: 'Always remember to logout when you\'re done to keep your account secure.'
        }
      ]
    }
  },
  methods: {
    handleStepChange(stepIndex) {
      console.log('Step changed to:', stepIndex);
      // You can add any additional logic here when steps change
    }
  }
}
</script>
