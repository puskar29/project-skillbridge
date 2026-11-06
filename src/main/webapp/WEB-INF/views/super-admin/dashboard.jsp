<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard | Admin | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css">
  <link rel="stylesheet" href="${cp}/assets/css/admin.css">
  <style>
    .system-overview { max-width: 1080px; padding: 4px 0 32px; }
    .overview-intro { margin: 0 0 30px; color: #4b5563; font-size: 16px; line-height: 1.8; }
    .overview-section { padding: 28px 0; border-bottom: 1px solid #e5e7eb; }
    .overview-section:first-of-type { border-top: 1px solid #e5e7eb; }
    .overview-section h2 { margin: 0 0 18px; color: #111827; font-family: "Poppins", sans-serif; font-size: 22px; font-weight: 600; }
    .overview-table-wrap { overflow-x: auto; border: 1px solid #dbeafe; border-radius: 12px; background: #ffffff; }
    .overview-table { width: 100%; min-width: 430px; border-collapse: collapse; }
    .overview-table th, .overview-table td { padding: 14px 18px; text-align: left; border-bottom: 1px solid #eef2f7; }
    .overview-table th { background: #f8fbff; color: #64748b; font-size: 12px; font-weight: 700; letter-spacing: 0.06em; text-transform: uppercase; }
    .overview-table td { color: #4b5563; font-size: 15px; }
    .overview-table td:last-child { color: #111827; font-weight: 600; text-align: right; }
    .overview-table tr:last-child td { border-bottom: 0; }
    .overview-table tbody tr:hover { background: #f8fbff; }
    .overview-action { margin: 20px 0 0; }
    .overview-legend { display: flex; flex-wrap: wrap; gap: 18px 30px; color: #475569; font-size: 15px; }
    .overview-legend span { display: inline-flex; align-items: center; }
    .legend-active { color: #059669; }
    .legend-pending { color: #d97706; }
    .legend-inactive { color: #dc2626; }
    @media (max-width: 640px) {
      .overview-item { flex-direction: column; align-items: flex-start; gap: 5px; }
      .overview-item dd { text-align: left; }
      .overview-section h2 { font-size: 20px; }
    }
  </style>
</head>
<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>
<jsp:include page="admin-sidebar.jsp"><jsp:param name="activePage" value="dashboard"/></jsp:include>
<div class="main-area">
  <header class="topbar">
    <div class="topbar-title"><h1>Dashboard</h1><p>Overall system information</p></div>
    <div class="topbar-actions">
      <a href="${cp}/home" class="view-site" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i> View Site</a>
      <img src="${cp}/assets/images/pfp.png" class="admin-avatar" alt="Admin profile picture">
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar"><i class="fa-solid fa-bars"></i></button>
    </div>
  </header>
  <div class="content">
    <div class="system-overview">
      <p class="overview-intro">A simple overview of users, organizations, opportunities, and platform activity.</p>

      <section class="overview-section">
        <h2>Students</h2>
        <div class="overview-table-wrap">
          <table class="overview-table">
            <thead><tr><th>Information</th><th>Count</th></tr></thead>
            <tbody>
              <tr><td>Total students</td><td>${totalStudents}</td></tr>
              <tr><td>Active students</td><td>${activeStudents}</td></tr>
              <tr><td>Inactive students</td><td>${inactiveStudents}</td></tr>
            </tbody>
          </table>
        </div>
      </section>

      <section class="overview-section">
        <h2>Organizations</h2>
        <div class="overview-table-wrap">
          <table class="overview-table">
            <thead><tr><th>Information</th><th>Count</th></tr></thead>
            <tbody>
              <tr><td>Total organizations</td><td>${organizers.size()}</td></tr>
              <tr><td>Approved organizations</td><td>${approvedCount}</td></tr>
              <tr><td>Pending approval</td><td>${pendingCount}</td></tr>
              <tr><td>Rejected organizations</td><td>${rejectedCount}</td></tr>
            </tbody>
          </table>
        </div>
        <p class="overview-action"><a href="${cp}/admin/organizers" class="btn btn-sm btn-outline">Manage organization approvals</a></p>
      </section>

      <section class="overview-section">
        <h2>Opportunities and activity</h2>
        <div class="overview-table-wrap">
          <table class="overview-table">
            <thead><tr><th>Information</th><th>Summary</th></tr></thead>
            <tbody>
              <tr><td>Internships</td><td>${activeInternships} active / ${totalInternships} total</td></tr>
              <tr><td>Workshops</td><td>${activeWorkshops} active / ${totalWorkshops} total</td></tr>
              <tr><td>Applications</td><td>${totalApplications}</td></tr>
              <tr><td>Pending applications</td><td>${pendingApplications}</td></tr>
              <tr><td>Workshop registrations</td><td>${totalRegistrations}</td></tr>
            </tbody>
          </table>
        </div>
      </section>

      <section class="overview-section">
        <h2>Status legend</h2>
        <div class="overview-legend">
          <span class="legend-active">Active / approved</span>
          <span class="legend-pending">Pending review</span>
          <span class="legend-inactive">Inactive / rejected</span>
        </div>
      </section>
    </div>
  </div>
</div>
<script src="${cp}/assets/js/admin.js"></script>
</body>
</html>
