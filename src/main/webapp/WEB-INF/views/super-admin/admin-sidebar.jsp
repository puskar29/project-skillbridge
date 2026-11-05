<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ap" value="${empty param.activePage ? 'dashboard' : param.activePage}"></c:set>

<!-- SIDEBAR (menu on the left) -->
<aside class="sidebar" id="sidebar">
  <div class="sidebar-brand">
    <img src="${cp}/assets/images/logo-skillbridge.png" alt="SkillBridge">
    <div>
      <div class="brand-text">Skill<span>Bridge</span></div>
      <div class="brand-tag">Admin Panel</div>
    </div>
  </div>

  <ul class="sidebar-nav sidebar-dark accordion" id="accordionSidebar">
    <li class="sidebar-divider my-0"></li>

    <li class="nav-item ${ap == 'dashboard' ? 'active' : ''}">
      <a href="${cp}/admin/home" class="nav-link ${ap == 'dashboard' ? 'active' : ''}">
        <i class="fa-solid fa-tachometer"></i><span>Dashboard</span>
      </a>
    </li>

    <li class="sidebar-divider"></li>
    <li class="sidebar-heading">Manage</li>

    <li class="nav-item ${ap == 'organizers' ? 'active' : ''}">
      <a href="${cp}/admin/organizers" class="nav-link ${ap == 'organizers' ? 'active' : ''}">
        <i class="fa-solid fa-users"></i><span>Organizers</span>
      </a>
    </li>

  </ul>

  <div class="sidebar-logout">
    <a href="${cp}/login">
      <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
  </div>
</aside>