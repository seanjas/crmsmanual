<template>
  <div class="max-w-6xl mx-auto bg-gradient-to-br from-white via-blue-50 to-cyan-50 rounded-3xl shadow-2xl p-12 border border-blue-100 relative overflow-hidden">
    <!-- Animated Background Particles -->
    <div class="absolute inset-0 overflow-hidden pointer-events-none">
      <div class="particle" v-for="i in 20" :key="i" :style="{
        left: Math.random() * 100 + '%',
        top: Math.random() * 100 + '%',
        animationDelay: Math.random() * 3 + 's',
        animationDuration: (Math.random() * 3 + 2) + 's'
      }"></div>
    </div>

    <h2 class="text-4xl font-extrabold mb-12 text-center bg-gradient-to-r from-blue-600 via-cyan-600 to-blue-800 bg-clip-text text-transparent relative z-10">
      <span v-for="(char, index) in title" :key="index"
            class="inline-block animate-bounce"
            :style="{ animationDelay: (index * 0.1) + 's' }">
        {{ char === ' ' ? '\u00A0' : char }}
      </span>
    </h2>

    <!-- Enhanced Horizontal Stepper -->
    <div class="flex flex-col items-center justify-center mb-12 relative z-10">
      <div class="flex w-full max-w-4xl">
        <div v-for="(step, idx) in steps" :key="'stepper-' + idx" class="flex-1 flex items-center">
          <button
            class="flex flex-col items-center focus:outline-none group relative"
            @click="goToStep(idx)"
            @keydown.enter="goToStep(idx)"
            @keydown.space="goToStep(idx)"
            tabindex="0"
          >
            <transition name="stepper-bounce" mode="out-in">
              <div
                v-if="idx === currentStep"
                :key="'active-' + idx"
                class="relative flex items-center justify-center"
              >
                <!-- Multiple animated rings for active step -->
                <span class="absolute inline-flex h-28 w-28 rounded-full bg-cyan-400 opacity-40 animate-ping-slow"></span>
                <span class="absolute inline-flex h-32 w-32 rounded-full bg-blue-400 opacity-30 animate-ping-slow" style="animation-delay: 0.4s;"></span>
                <span class="absolute inline-flex h-36 w-36 rounded-full bg-indigo-400 opacity-20 animate-ping-slow" style="animation-delay: 0.8s;"></span>
                <span class="absolute inline-flex h-40 w-40 rounded-full bg-purple-400 opacity-15 animate-ping-slow" style="animation-delay: 1.2s;"></span>

                <div
                  class="w-24 h-24 flex items-center justify-center rounded-full font-black text-white text-4xl bg-gradient-to-br from-blue-500 via-cyan-500 to-indigo-600 shadow-2xl ring-4 ring-cyan-200 animate-glow scale-110 transition-all duration-300 z-10 hover:scale-125 hover:shadow-3xl transform-gpu"
                  style="box-shadow: 0 0 32px 8px rgba(6, 182, 212, 0.4), 0 8px 32px rgba(59, 130, 246, 0.3);"
                >
                  {{ idx + 1 }}
                </div>

                <!-- Success checkmark for completed steps -->
                <div v-if="idx < currentStep" class="absolute -top-2 -right-2 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center animate-pulse">
                  <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path>
                  </svg>
                </div>
              </div>
              <div
                v-else
                :key="'inactive-' + idx"
                class="w-20 h-20 flex items-center justify-center rounded-full font-bold text-white text-2xl bg-gradient-to-br from-gray-400 to-gray-500 transition-all duration-300 hover:scale-110 hover:from-gray-500 hover:to-gray-600 shadow-lg transform-gpu"
                style="box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);"
              >
                {{ idx + 1 }}
              </div>
            </transition>
            <span class="text-base mt-4 text-center w-32 text-gray-700 font-semibold transition-all duration-300 group-hover:text-blue-600">
              {{ step.title }}
            </span>
          </button>

          <!-- Enhanced progress connector -->
          <div v-if="idx < steps.length - 1" class="flex-1 h-3 bg-gradient-to-r from-gray-200 to-gray-300 mx-4 rounded-full relative overflow-hidden shadow-inner">
            <div
              v-if="idx < currentStep"
              class="absolute left-0 top-0 h-3 w-full bg-gradient-to-r from-blue-500 via-cyan-400 to-indigo-500 shadow-lg animate-progress"
              style="box-shadow: 0 0 8px rgba(59, 130, 246, 0.5);"
            ></div>
            <div
              v-else-if="idx === currentStep"
              class="absolute left-0 top-0 h-3 w-1/2 bg-gradient-to-r from-blue-500 via-cyan-400 to-indigo-500 shadow-lg animate-pulse"
              style="box-shadow: 0 0 8px rgba(59, 130, 246, 0.5);"
            ></div>
          </div>
        </div>
      </div>

      <!-- Enhanced Progress Bar -->
      <div class="relative w-full max-w-4xl h-6 mt-10">
        <div class="absolute top-0 left-0 w-full h-6 bg-gradient-to-r from-gray-200 to-gray-300 rounded-full shadow-inner"></div>
        <div
          class="absolute top-0 left-0 h-6 rounded-full shadow-lg transition-all duration-1000 ease-out"
          :style="{
            width: ((currentStep + 1) / steps.length * 100) + '%',
            background: 'linear-gradient(90deg, #3b82f6 0%, #06b6d4 50%, #6366f1 100%)',
            boxShadow: '0 0 20px 4px rgba(6, 182, 212, 0.4), 0 4px 16px rgba(59, 130, 246, 0.3)'
          }"
        ></div>
        <!-- Progress percentage indicator -->
        <div class="absolute -bottom-8 left-1/2 transform -translate-x-1/2 text-sm font-semibold text-blue-600">
          {{ Math.round(((currentStep + 1) / steps.length) * 100) }}% Complete
        </div>
      </div>
    </div>

    <!-- Enhanced Step Content -->
    <transition name="fade-slide" mode="out-in">
      <div :key="currentStep" class="flex flex-col md:flex-row items-center md:items-center gap-16 mt-8 relative z-10">
        <transition name="img-pop" mode="out-in">
          <div :key="'img-' + currentStep" class="flex-shrink-0 w-full md:w-2/3 flex justify-center items-center relative">
            <div class="relative w-full max-w-2xl h-[32rem] flex items-center justify-center">
              <div class="absolute -inset-4 bg-gradient-to-r from-blue-400 via-cyan-400 to-indigo-400 rounded-3xl opacity-30 group-hover:opacity-50 transition duration-500 z-0"></div>
              <img
                v-if="steps[currentStep].image"
                :src="steps[currentStep].image"
                :alt="'Step ' + (currentStep + 1)"
                class="relative w-full h-full object-contain rounded-3xl shadow-2xl border-4 border-cyan-100 bg-gradient-to-br from-white to-blue-50 transition-all duration-700 hover:scale-105 hover:shadow-3xl transform-gpu z-10"
              />
            </div>
          </div>
        </transition>

        <div class="w-full md:w-1/2 flex flex-col justify-center items-center md:items-start text-center md:text-left">
          <div class="bg-gradient-to-r from-blue-50 to-cyan-50 p-8 rounded-2xl border border-blue-100 shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1">
            <h3 class="text-3xl font-bold mb-6 bg-gradient-to-r from-blue-700 via-cyan-700 to-indigo-700 bg-clip-text text-transparent">
              {{ steps[currentStep].title }}
            </h3>
            <p class="text-gray-700 text-xl leading-relaxed font-medium">
              {{ steps[currentStep].description }}
            </p>

            <!-- Step tips -->
            <div v-if="steps[currentStep].tip" class="mt-6 p-4 bg-yellow-50 border-l-4 border-yellow-400 rounded-r-lg">
              <div class="flex items-center">
                <svg class="w-5 h-5 text-yellow-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <span class="text-yellow-800 font-medium">Pro Tip</span>
              </div>
              <p class="text-yellow-700 text-sm mt-1">{{ steps[currentStep].tip }}</p>
            </div>
          </div>
        </div>
      </div>
    </transition>

    <!-- Enhanced Navigation -->
    <div class="flex justify-between items-center mt-16 relative z-10">
      <button
        class="px-10 py-4 bg-gradient-to-r from-gray-200 to-gray-300 rounded-xl text-lg font-semibold hover:from-gray-300 hover:to-gray-400 transition-all duration-300 transform hover:-translate-y-2 hover:scale-105 active:scale-95 shadow-lg hover:shadow-xl disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none focus:outline-none focus:ring-4 focus:ring-gray-300"
        :disabled="currentStep === 0"
        @click="prevStep"
        @keydown.enter="prevStep"
        @keydown.space="prevStep"
        tabindex="0"
      >
        <span class="flex items-center">
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
          </svg>
          Back
        </span>
      </button>

      <!-- Keyboard shortcuts hint centered -->
      <div class="text-center text-sm text-gray-500">
        <p>💡 Use <kbd class="px-2 py-1 bg-gray-200 rounded text-xs">←</kbd> <kbd class="px-2 py-1 bg-gray-200 rounded text-xs">→</kbd> arrow keys to navigate</p>
      </div>

      <button
        class="px-10 py-4 bg-gradient-to-r from-blue-500 via-cyan-500 to-indigo-600 text-white rounded-xl text-lg font-semibold hover:from-blue-600 hover:via-cyan-600 hover:to-indigo-700 transition-all duration-300 transform hover:-translate-y-2 hover:scale-105 active:scale-95 shadow-lg hover:shadow-2xl disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none focus:outline-none focus:ring-4 focus:ring-blue-300"
        :disabled="currentStep === steps.length - 1"
        @click="nextStep"
        @keydown.enter="nextStep"
        @keydown.space="nextStep"
        tabindex="0"
      >
        <span class="flex items-center">
          Next
          <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
          </svg>
        </span>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'BaseStepper',
  props: {
    title: {
      type: String,
      required: true
    },
    steps: {
      type: Array,
      required: true,
      validator: function(steps) {
        return steps.every(step =>
          step.title &&
          step.description &&
          step.image
        );
      }
    }
  },
  data() {
    return {
      currentStep: 0
    }
  },
  mounted() {
    // Add keyboard navigation
    document.addEventListener('keydown', this.handleKeydown);
  },
  beforeUnmount() {
    // Clean up event listener
    document.removeEventListener('keydown', this.handleKeydown);
  },
  methods: {
    nextStep() {
      if (this.currentStep < this.steps.length - 1) {
        this.currentStep++;
        this.$emit('step-changed', this.currentStep);
      }
    },
    prevStep() {
      if (this.currentStep > 0) {
        this.currentStep--;
        this.$emit('step-changed', this.currentStep);
      }
    },
    goToStep(idx) {
      this.currentStep = idx;
      this.$emit('step-changed', this.currentStep);
    },
    handleKeydown(event) {
      switch(event.key) {
        case 'ArrowRight':
          event.preventDefault();
          this.nextStep();
          break;
        case 'ArrowLeft':
          event.preventDefault();
          this.prevStep();
          break;
        case 'Home':
          event.preventDefault();
          this.goToStep(0);
          break;
        case 'End':
          event.preventDefault();
          this.goToStep(this.steps.length - 1);
          break;
      }
    }
  }
}
</script>

<style scoped>
/* Particle animation */
.particle {
  position: absolute;
  width: 4px;
  height: 4px;
  background: linear-gradient(45deg, #3b82f6, #06b6d4);
  border-radius: 50%;
  animation: float 3s ease-in-out infinite;
  opacity: 0.6;
}

@keyframes float {
  0%, 100% {
    transform: translateY(0px) translateX(0px);
    opacity: 0.6;
  }
  50% {
    transform: translateY(-20px) translateX(10px);
    opacity: 0.2;
  }
}

@keyframes glow {
  0% {
    box-shadow: 0 0 0 0 rgba(6, 182, 212, 0.4), 0 0 0 0 rgba(59, 130, 246, 0.3);
  }
  50% {
    box-shadow: 0 0 32px 8px rgba(6, 182, 212, 0.6), 0 8px 32px rgba(59, 130, 246, 0.5);
  }
  100% {
    box-shadow: 0 0 32px 8px rgba(6, 182, 212, 0.4), 0 8px 32px rgba(59, 130, 246, 0.3);
  }
}

.animate-glow {
  animation: glow 2s ease-in-out infinite;
}

@keyframes progress {
  0% { transform: translateX(-100%); }
  100% { transform: translateX(0); }
}

.animate-progress {
  animation: progress 1s ease-out forwards;
}

.fade-slide-enter-active, .fade-slide-leave-active {
  transition: all 0.7s cubic-bezier(0.4, 0, 0.2, 1);
}

.fade-slide-enter-from {
  opacity: 0;
  transform: translateY(60px) scale(0.95);
}

.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-60px) scale(1.05);
}

.img-pop-enter-active, .img-pop-leave-active {
  transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
}

.img-pop-enter-from {
  opacity: 0;
  transform: scale(0.9) rotate(-5deg);
}

.img-pop-leave-to {
  opacity: 0;
  transform: scale(1.1) rotate(5deg);
}

.stepper-bounce-enter-active, .stepper-bounce-leave-active {
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.stepper-bounce-enter-from {
  transform: scale(0.7) rotate(-10deg);
  opacity: 0.3;
}

.stepper-bounce-leave-to {
  transform: scale(1.3) rotate(10deg);
  opacity: 0.3;
}

/* Custom shadow utilities */
.shadow-3xl {
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
}

/* Hover effects for better interactivity */
.group:hover .group-hover\:text-blue-600 {
  color: #2563eb;
}

/* Enhanced button hover effects */
button:hover {
  transform: translateY(-2px) scale(1.05);
}

button:active {
  transform: translateY(0) scale(0.95);
}

/* Focus styles for accessibility */
button:focus {
  outline: none;
  ring: 4px;
  ring-color: rgba(59, 130, 246, 0.5);
}

/* Keyboard shortcut styling */
kbd {
  font-family: 'Courier New', monospace;
  font-weight: bold;
}

/* 3D transform support */
.transform-gpu {
  transform: translateZ(0);
  backface-visibility: hidden;
  perspective: 1000px;
}

/* Enhanced animations */
@keyframes bounce {
  0%, 20%, 53%, 80%, 100% {
    transform: translate3d(0, 0, 0);
  }
  40%, 43% {
    transform: translate3d(0, -8px, 0);
  }
  70% {
    transform: translate3d(0, -4px, 0);
  }
  90% {
    transform: translate3d(0, -2px, 0);
  }
}

.animate-bounce {
  animation: bounce 1s infinite;
}

/* Custom slow ping animation */
@keyframes ping-slow {
  75%, 100% {
    transform: scale(2);
    opacity: 0;
  }
}

.animate-ping-slow {
  animation: ping-slow 3s cubic-bezier(0, 0, 0.2, 1) infinite;
}

/* Responsive improvements */
@media (max-width: 768px) {
  .particle {
    display: none;
  }
}
</style>
