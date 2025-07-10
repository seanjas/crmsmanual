# Stepper Components

This folder contains reusable stepper components for creating interactive tutorials and guides in the CRMS application.

## Components

### BaseStepper.vue
A comprehensive, reusable stepper component with advanced animations and features.

#### Features
- ✨ Animated background particles
- ⌨️ Keyboard navigation (arrow keys, home, end)
- 🎯 Progress tracking with percentage
- 🖼️ Image transitions with hover effects
- 💡 Pro tips for each step
- 🎨 Beautiful animations and transitions
- 📱 Responsive design
- ♿ Accessibility features

#### Props
- `title` (String, required): The main title of the stepper
- `steps` (Array, required): Array of step objects with the following structure:
  ```javascript
  {
    title: 'Step Title',
    description: 'Step description text',
    image: '/path/to/image.png',
    tip: 'Optional pro tip for this step' // Optional
  }
  ```

#### Events
- `step-changed`: Emitted when the current step changes
  - Parameter: `stepIndex` (Number) - The new step index

#### Usage Example
```vue
<template>
  <BaseStepper 
    :title="'How to Login and Logout'"
    :steps="steps"
    @step-changed="handleStepChange"
  />
</template>

<script>
import BaseStepper from '../stepper/BaseStepper.vue'

export default {
  components: {
    BaseStepper
  },
  data() {
    return {
      steps: [
        {
          title: 'Welcome',
          description: 'Welcome to the system.',
          image: '/img/welcome.png',
          tip: 'Take your time to understand each step.'
        },
        // ... more steps
      ]
    }
  },
  methods: {
    handleStepChange(stepIndex) {
      console.log('Step changed to:', stepIndex);
    }
  }
}
</script>
```

## Creating New Manual Components

To create a new manual component using the BaseStepper:

1. **Create a new Vue component** in the `manual/` folder
2. **Import BaseStepper** from `../stepper/BaseStepper.vue`
3. **Define your steps** with title, description, image, and optional tip
4. **Use the component** with your data

### Example: UserRegistration.vue
```vue
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
  name: 'UserRegistration',
  components: {
    BaseStepper
  },
  data() {
    return {
      title: 'How to Register a New User',
      steps: [
        {
          title: 'Access Registration',
          description: 'Navigate to the user management section...',
          image: '/img/registration-access.png',
          tip: 'Make sure you have the necessary permissions.'
        },
        // ... more steps
      ]
    }
  },
  methods: {
    handleStepChange(stepIndex) {
      // Handle step changes
    }
  }
}
</script>
```

## Keyboard Shortcuts

The BaseStepper supports the following keyboard shortcuts:
- `←` (Left Arrow): Previous step
- `→` (Right Arrow): Next step
- `Home`: Go to first step
- `End`: Go to last step
- `Enter` / `Space`: Activate buttons

## Styling

The component uses Tailwind CSS classes and includes:
- Gradient backgrounds
- Smooth transitions
- Hover effects
- Responsive design
- Custom animations

## Browser Support

- Modern browsers with ES6+ support
- CSS animations work in all modern browsers

## Performance

- GPU-accelerated transforms for smooth animations
- Optimized particle system (disabled on mobile)
- Efficient event handling with proper cleanup
- Lazy loading of images

## Accessibility

- Full keyboard navigation
- Focus indicators
- Screen reader friendly
- High contrast support
- Semantic HTML structure 
