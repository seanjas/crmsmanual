<template>
  <div class="bg-white overflow-hidden shadow rounded-lg">
    <div class="px-4 py-5 sm:p-6">
      <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
        Recent Activity
      </h3>

      <div class="flow-root">
        <ul class="-mb-8">
          <li v-for="(activity, index) in activities" :key="index">
            <div class="relative pb-8">
              <span v-if="index !== activities.length - 1" class="absolute top-4 left-4 -ml-px h-full w-0.5 bg-gray-200" aria-hidden="true"></span>
              <div class="relative flex space-x-3">
                <div>
                  <span :class="activity.iconBg" class="h-8 w-8 rounded-full flex items-center justify-center ring-8 ring-white">
                    <svg v-if="activity.type === 'order'" class="h-5 w-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    <svg v-else-if="activity.type === 'user'" class="h-5 w-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    <svg v-else-if="activity.type === 'payment'" class="h-5 w-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                    </svg>
                    <svg v-else-if="activity.type === 'shipping'" class="h-5 w-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
                    </svg>
                  </span>
                </div>
                <div class="min-w-0 flex-1 pt-1.5 flex justify-between space-x-4">
                  <div>
                    <p class="text-sm text-gray-500">
                      {{ activity.message }}
                      <span class="font-medium text-gray-900">{{ activity.user }}</span>
                      <span v-if="activity.message2">{{ activity.message2 }}</span>
                    </p>
                  </div>
                  <div class="text-right text-sm whitespace-nowrap text-gray-500">
                    <time>{{ activity.time }}</time>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'RecentActivity',
  data() {
    return {
      activities: [
        {
          message: 'New order placed by ',
          user: 'John Doe',
          time: '2 minutes ago',
          type: 'order',
          iconBg: 'bg-green-500'
        },
        {
          message: 'Customer ',
          user: 'Jane Smith',
          message2: ' updated their profile',
          time: '1 hour ago',
          type: 'user',
          iconBg: 'bg-blue-500'
        },
        {
          message: 'Payment received from ',
          user: 'Mike Johnson',
          time: '3 hours ago',
          type: 'payment',
          iconBg: 'bg-green-500'
        },
        {
          message: 'New customer ',
          user: 'Sarah Wilson',
          message2: ' registered',
          time: '5 hours ago',
          type: 'user',
          iconBg: 'bg-purple-500'
        },
        {
          message: 'Order #1234 shipped to ',
          user: 'Robert Brown',
          time: '1 day ago',
          type: 'shipping',
          iconBg: 'bg-orange-500'
        }
      ]
    }
  }
}
</script>
