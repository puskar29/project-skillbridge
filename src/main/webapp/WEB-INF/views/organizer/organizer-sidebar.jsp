<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ap" value="${empty param.activePage ? 'dashboard' : param.activePage}"></c:set>
<c:set var="internshipsActive" value="${ap == 'add-internship' || ap == 'manage-internships'}"></c:set>
<c:set var="workshopsActive" value="${ap == 'add-workshop' || ap == 'manage-workshops'}"></c:set>

<!-- SIDEBAR (menu on the left) -->
<aside class="sidebar" id="sidebar">
  <div class="sidebar-brand">
    <img src="${cp}/assets/images/logo-skillbridge.png" alt="SkillBridge">
    <div>
      <div class="brand-text">Skill<span>Bridge</span></div>
      <div class="brand-tag">Organizer Panel</div>
    </div>
  </div>

  <ul class="sidebar-nav sidebar-dark accordion" id="accordionSidebar">
    <li class="sidebar-divider my-0"></li>

    <li class="nav-item ${ap == 'dashboard' ? 'active' : ''}">
      <a href="${cp}/organizer/home" class="nav-link ${ap == 'dashboard' ? 'active' : ''}">
        <i class="fa-solid fa-tachometer"></i><span>Dashboard</span>
      </a>
    </li>

    <li class="nav-item ${ap == 'profile' ? 'active' : ''}">
      <a href="${cp}/organizer/profile" class="nav-link ${ap == 'profile' ? 'active' : ''}">
        <i class="fa-solid fa-building"></i><span>Organization Profile</span>
      </a>
    </li>

    <li class="sidebar-divider"></li>
    <li class="sidebar-heading">Manage</li>

    <li class="nav-item ${internshipsActive ? 'active' : ''}">
      <a href="#" class="nav-link ${internshipsActive ? '' : 'collapsed'}" data-toggle="collapse" data-target="#collapseInternships"
         aria-expanded="${internshipsActive}" aria-controls="collapseInternships">
        <i class="fa-solid fa-briefcase"></i><span>Internships</span>
        <i class="fa-solid fa-chevron-down nav-chevron"></i>
      </a>
      <div id="collapseInternships" class="collapse ${internshipsActive ? 'show' : ''}" aria-labelledby="headingInternships">
        <div class="collapse-inner">
          <h6 class="collapse-header" id="headingInternships">Internship Management</h6>
          <a href="${cp}/organizer/internship/add" class="collapse-item ${ap == 'add-internship' ? 'active' : ''}">Add Internship</a>
          <a href="${cp}/organizer/internship/manage" class="collapse-item ${ap == 'manage-internships' ? 'active' : ''}">Manage Internships</a>
        </div>
      </div>
    </li>

    <li class="nav-item ${workshopsActive ? 'active' : ''}">
      <a href="#" class="nav-link ${workshopsActive ? '' : 'collapsed'}" data-toggle="collapse" data-target="#collapseWorkshops"
         aria-expanded="${workshopsActive}" aria-controls="collapseWorkshops">
        <i class="fa-solid fa-chalkboard-user"></i><span>Workshops</span>
        <i class="fa-solid fa-chevron-down nav-chevron"></i>
      </a>
      <div id="collapseWorkshops" class="collapse ${workshopsActive ? 'show' : ''}" aria-labelledby="headingWorkshops">
        <div class="collapse-inner">
          <h6 class="collapse-header" id="headingWorkshops">Workshop Management</h6>
          <a href="${cp}/organizer/workshop/add" class="collapse-item ${ap == 'add-workshop' ? 'active' : ''}">Add Workshop</a>
          <a href="${cp}/organizer/workshop/manage" class="collapse-item ${ap == 'manage-workshops' ? 'active' : ''}">Manage Workshops</a>
        </div>
      </div>
    </li>

    <li class="sidebar-divider"></li>
    <li class="sidebar-heading">Review</li>

    <li class="nav-item ${ap == 'applications' ? 'active' : ''}">
      <a href="${cp}/organizer/applications" class="nav-link ${ap == 'applications' ? 'active' : ''}">
        <i class="fa-solid fa-file-lines"></i><span>Applications</span>
      </a>
    </li>

    <li class="nav-item ${ap == 'registrations' ? 'active' : ''}">
      <a href="${cp}/organizer/registrations" class="nav-link ${ap == 'registrations' ? 'active' : ''}">
        <i class="fa-solid fa-clipboard-check"></i><span>Registrations</span>
      </a>
    </li>

  </ul>

  <div class="sidebar-logout">
    <a href="${cp}/login">
      <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
  </div>
</aside>
