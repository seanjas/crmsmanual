<template>
  <div class="flex h-screen bg-gray-50">
    <!-- Sidebar -->
    <Sidebar :active-content="manualContent" @show-manual="showManualContent" />

    <!-- Main Content -->
    <div class="flex-1 flex flex-col overflow-hidden">
      <!-- Header -->
      <Header />

      <!-- Main Content Area -->
      <main class="flex-1 overflow-x-hidden overflow-y-auto bg-gray-50 p-6">
        <div class="max-w-7xl mx-auto">
          <LoginLogout v-if="manualContent === 'login-logout'" />
          <ChangePassword v-if="manualContent === 'change-password'" />
          <CreateDocument v-if="manualContent === 'create-document'" />
          <Dashboard v-if="manualContent === 'dashboard' || manualContent === null" />
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import Sidebar from './Sidebar.vue';
import Header from './Header.vue';
import StatCard from './StatCard.vue';
import ChartCard from './ChartCard.vue';
import RecentActivity from './RecentActivity.vue';
import OrdersTable from './OrdersTable.vue';
import LoginLogout from './manual/LoginLogout.vue';
import ChangePassword from './manual/ChangePassword.vue';
import CreateDocument from './manual/CreateDocument.vue';
import Dashboard from './Dashboard.vue';

export default {
  name: 'Index',
  components: {
    Sidebar,
    Header,
    StatCard,
    ChartCard,
    RecentActivity,
    OrdersTable,
    LoginLogout,
    ChangePassword,
    CreateDocument,
    Dashboard
  },
  data() {
    return {
      manualContent: null
    }
  },
  methods: {
    showManualContent(content) {
      this.manualContent = content;
    }
  }
}
</script>
