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

<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR -->
<aside class="sidebar" id="sidebar">
  <div class="sidebar-brand">
    <img src="${cp}/assets/images/logo-skillbridge.png" alt="SkillBridge">
    <div>
      <div class="brand-text">Skill<span>Bridge</span></div>
      <div class="brand-tag">Student Portal</div>
    </div>
  </div>

  <nav class="sidebar-nav">
    <div class="sidebar-label">Main</div>
    <a href="#" class="nav-item ${ap == 'overview' ? 'active' : ''}" data-page="overview" onclick="openPage('overview'); return false;">
      <i class="fa-solid fa-table-cells"></i> Overview
    </a>
    <a href="#" class="nav-item ${ap == 'browse' ? 'active' : ''}" data-page="browse" onclick="openPage('browse'); return false;">
      <i class="fa-solid fa-compass"></i> Browse &amp; Apply
    </a>

    <div class="sidebar-label">My Activity</div>
    <a href="#" class="nav-item ${ap == 'applications' ? 'active' : ''}" data-page="applications" onclick="openPage('applications'); return false;">
      <i class="fa-solid fa-file-lines"></i> My Applications
    </a>
    <a href="#" class="nav-item ${ap == 'registrations' ? 'active' : ''}" data-page="registrations" onclick="openPage('registrations'); return false;">
      <i class="fa-solid fa-clipboard-check"></i> My Registrations
    </a>

    <div class="sidebar-label">Account</div>
    <a href="#" class="nav-item ${ap == 'profile' ? 'active' : ''}" data-page="profile" onclick="openPage('profile'); return false;">
      <i class="fa-solid fa-user"></i> My Profile
    </a>
  </nav>

  <div class="sidebar-logout">
    <a href="${cp}/login">
      <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
  </div>
</aside>