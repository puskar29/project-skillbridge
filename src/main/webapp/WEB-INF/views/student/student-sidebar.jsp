<%--
  Shared STUDENT sidebar partial.
  Include it inside <body> with:
  <jsp:include page="student-sidebar.jsp">
    <jsp:param name="activePage" value="overview" />
  </jsp:include>
  activePage values: overview | browse | applications | registrations | profile
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ap" value="${empty param.activePage ? 'overview' : param.activePage}"></c:set>

<style>
  .sidebar.student-sidebar {
    background-color: #0d47a1;
    color: rgba(255, 255, 255, 0.85);
  }

  .sidebar.student-sidebar .sidebar-brand {
    border-bottom-color: rgba(255, 255, 255, 0.15);
  }

  .sidebar.student-sidebar .brand-text {
    color: #ffffff;
  }

  .sidebar.student-sidebar .brand-text span {
    color: #90caf9;
  }

  .sidebar.student-sidebar .brand-tag,
  .sidebar.student-sidebar .sidebar-label {
    color: rgba(255, 255, 255, 0.7);
  }

  .sidebar.student-sidebar .nav-item {
    color: rgba(255, 255, 255, 0.8);
  }

  .sidebar.student-sidebar .nav-item i {
    color: rgba(255, 255, 255, 0.4);
  }

  .sidebar.student-sidebar .nav-item:hover,
  .sidebar.student-sidebar .nav-item.active {
    background: rgba(144, 202, 249, 0.2);
    color: #ffffff;
  }

  .sidebar.student-sidebar .nav-item:hover i,
  .sidebar.student-sidebar .nav-item.active i {
    color: #ffffff;
  }

  .sidebar.student-sidebar .sidebar-logout {
    border-top-color: rgba(255, 255, 255, 0.15);
  }

  .sidebar.student-sidebar .sidebar-logout a {
    color: #ffcdd2;
  }

  .sidebar.student-sidebar .sidebar-logout a:hover {
    background: rgba(239, 68, 68, 0.2);
    color: #ffffff;
  }
</style>

<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR -->
<aside class="sidebar student-sidebar" id="sidebar">
  <div class="sidebar-brand">
    <img src="${cp}/assets/images/logo-skillbridge.png" alt="SkillBridge">
    <div>
      <div class="brand-text">Skill<span>Bridge</span></div>
      <div class="brand-tag">Student Portal</div>
    </div>
  </div>

  <nav class="sidebar-nav">
    <div class="sidebar-label">Main</div>
    <a href="${cp}/student/dashboard" class="nav-item ${ap == 'overview' ? 'active' : ''}" data-page="overview" onclick="if(typeof openPage === 'function'){openPage('overview'); return false;}">
      <i class="fa-solid fa-table-cells"></i> Overview
    </a>
    <a href="${cp}/student/dashboard#browse" class="nav-item ${ap == 'browse' ? 'active' : ''}" data-page="browse" onclick="if(typeof openPage === 'function'){openPage('browse'); return false;}">
      <i class="fa-solid fa-compass"></i> Browse &amp; Apply
    </a>

    <div class="sidebar-label">My Activity</div>
    <a href="${cp}/student/dashboard#applications" class="nav-item ${ap == 'applications' ? 'active' : ''}" data-page="applications" onclick="if(typeof openPage === 'function'){openPage('applications'); return false;}">
      <i class="fa-solid fa-file-lines"></i> My Applications
    </a>
    <a href="${cp}/student/dashboard#registrations" class="nav-item ${ap == 'registrations' ? 'active' : ''}" data-page="registrations" onclick="if(typeof openPage === 'function'){openPage('registrations'); return false;}">
      <i class="fa-solid fa-clipboard-check"></i> My Registrations
    </a>

    <div class="sidebar-label">Account</div>
    <a href="${cp}/student/profile" class="nav-item ${ap == 'profile' ? 'active' : ''}" data-page="profile">
      <i class="fa-solid fa-user"></i> My Profile
    </a>
  </nav>

  <div class="sidebar-logout">
    <a href="${cp}/login">
      <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
  </div>
</aside>