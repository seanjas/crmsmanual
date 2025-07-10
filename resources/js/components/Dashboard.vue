<template>
    <div class="relative flex flex-col items-center justify-center min-h-screen bg-gradient-to-br from-blue-50 via-cyan-50 to-white p-8">

      <!-- Logo Top Left -->
      <!-- <img
        src="/assets/logo-left.png"
        alt="Left Logo"
        class="absolute top-4 left-4 w-20 h-auto"
      /> -->

      <!-- Logo Top Right -->
      <!-- <img
        src="/assets/logo-right.png"
        alt="Right Logo"
        class="absolute top-4 right-4 w-20 h-auto"
      /> -->

      <div class="flex flex-col md:flex-row items-center gap-8 mb-8">
        <div class="text-center md:text-left">
          <h1 class="text-4xl md:text-5xl font-extrabold text-blue-800 mb-2">Welcome to CRMS V2</h1>
          <h2 class="text-2xl font-semibold text-cyan-700 mb-4">City Records Management System</h2>
          <p class="text-lg text-gray-700 max-w-2xl">
            CRMS V2 is a modern, user-friendly system developed by the
            <span class="font-bold text-blue-700">City Archives and Records Office</span>
            to streamline the creation, management, and routing of official documents. With features like secure document composition, digital signatures, recipient management, and attachment handling, CRMS V2 empowers city employees to efficiently manage records and ensure compliance with administrative standards.<br/><br/>
            Easily compose new documents, set urgency, select recipients, categorize records, assign signatories, and attach files or links. Preview your work and send with confidence—CRMS V2 keeps your workflow organized and your records secure.
          </p>
        </div>
      </div>
    </div>
  </template>

  <script>
  export default {
    name: 'Dashboard'
  }
  </script>
