<%--
  Admin Dashboard — Organizers overview (frontend only)
--%>
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

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script src="https://cdn.tailwindcss.com"></script>
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <link rel="stylesheet" href="${cp}/assets/css/admin.css">
</head>

<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<jsp:include page="admin-sidebar.jsp">
  <jsp:param name="activePage" value="dashboard"/>
</jsp:include>

<div class="main-area">
  <header class="topbar">
    <div class="topbar-title">
      <h1>Dashboard</h1>
      <p>Overview of registered organizers</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/index" class="view-site" target="_blank">
        <i class="fa-solid fa-arrow-up-right-from-square"></i> View Site
      </a>
      <div class="admin-avatar" title="Admin">A</div>
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar">
        <i class="fa-solid fa-bars"></i>
      </button>
    </div>
  </header>

  <div class="content">
    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-icon blue"><i class="fa-solid fa-users"></i></div>
        <div class="stat-info">
          <h3>12</h3>
          <p>Total Organizers</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon amber"><i class="fa-solid fa-clock"></i></div>
        <div class="stat-info">
          <h3>4</h3>
          <p>Pending Approval</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon green"><i class="fa-solid fa-check"></i></div>
        <div class="stat-info">
          <h3>7</h3>
          <p>Approved</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon red"><i class="fa-solid fa-xmark"></i></div>
        <div class="stat-info">
          <h3>1</h3>
          <p>Rejected</p>
        </div>
      </div>
    </div>

    <div class="panel">
      <div class="panel-header">
        <h2>Recent Organizer Registrations</h2>
        <div class="panel-actions">
          <a href="${cp}/admin/organizers" class="btn btn-sm btn-outline">View All</a>
        </div>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm [&_th]:whitespace-nowrap [&_th]:border-b [&_th]:border-[#90caf9] [&_th]:bg-[#e3f2fd] [&_th]:px-3.5 [&_th]:py-3 [&_th]:text-left [&_th]:font-heading [&_th]:text-[11px] [&_th]:font-semibold [&_th]:uppercase [&_th]:tracking-wider [&_th]:text-[#546e7e] [&_td]:border-b [&_td]:border-[#e3f2fd] [&_td]:px-3.5 [&_td]:py-3.5 [&_td]:align-middle [&_td]:text-[#0d47a1] [&_tr:last-child_td]:border-b-0 [&_tbody_tr:hover_td]:bg-[#e3f2fd]">
          <thead>
          <tr>
            <th>Organization</th>
            <th>Email</th>
            <th>Registered</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <tr data-id="1" data-status="pending">
            <td><strong>Himalayan Labs</strong></td>
            <td>contact@himalayanlabs.com</td>
            <td>Oct 10, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap">
                <a href="${cp}/admin/organizers" class="btn btn-sm btn-primary"><i class="fa-solid fa-eye"></i> Review</a>
              </div>
            </td>
          </tr>
          <tr data-id="2" data-status="approved">
            <td><strong>Code Himalaya</strong></td>
            <td>info@codehimalaya.org</td>
            <td>Oct 08, 2026</td>
            <td><span class="status-approved">Approved</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap">
                <a href="${cp}/admin/organizers" class="btn btn-sm btn-outline"><i class="fa-solid fa-eye"></i> View</a>
              </div>
            </td>
          </tr>
          <tr data-id="3" data-status="pending">
            <td><strong>Tech Valley</strong></td>
            <td>hello@techvalley.com</td>
            <td>Oct 05, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap">
                <a href="${cp}/admin/organizers" class="btn btn-sm btn-primary"><i class="fa-solid fa-eye"></i> Review</a>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<jsp:include page="admin-modal.jsp"></jsp:include>

<div class="toast" id="toast">
  <i class="fa-solid fa-circle-check"></i>
  <p id="toastMsg">Saved successfully</p>
</div>

<script src="${cp}/assets/js/admin.js"></script>
</body>
</html>