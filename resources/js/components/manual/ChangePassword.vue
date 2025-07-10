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
  name: 'ChangePassword',
  components: {
    BaseStepper
  },
  data() {
    return {
      title: 'How to Change Your Login Password',
      steps: [
        {
          title: 'Login to Your Account',
          description: 'Login to your CRMS account using your current username and password.',
          image: '/img_changepass/login.png',
          tip: 'Make sure you remember your current password before proceeding with the change.'
        },
        {
          title: 'Access Your Profile',
          description: 'Click your account name found on the upper right corner of your screen.',
          image: '/img_changepass/click_profile.png',
          tip: 'Your account name is typically displayed in the top navigation bar.'
        },
        {
          title: 'Change Password Option',
          description: 'Under your account name, click the change password button.',
          image: '/img_changepass/changepass.png',
          tip: 'This option is usually found in a dropdown menu or profile settings.'
        },
        {
          title: 'Enter New Password',
          description: 'On the change password screen, enter your new password, re-enter it to confirm, and then click "Save".',
          image: '/img_changepass/changepass_screen.png',
          tip: 'Choose a strong password with a mix of letters, numbers, and special characters.'
        },
        {
          title: 'Successfully Updated',
          description: 'Your new password has been successfully saved. The next time you log in to your account, use the new password you just set.',
          image: '/img_changepass/changepass_save.png',
          tip: 'Remember to keep your new password secure and don\'t share it with others.'
        }
      ]
    }
  },
  methods: {
    handleStepChange(stepIndex) {
      console.log('Change Password step changed to:', stepIndex);
      // You can add any additional logic here when steps change
    }
  }
}
</script>
