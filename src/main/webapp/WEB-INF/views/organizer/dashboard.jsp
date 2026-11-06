<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css">
  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
</head>
<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>
<jsp:include page="organizer-sidebar.jsp"><jsp:param name="activePage" value="dashboard"/></jsp:include>
<div class="main-area">
  <header class="topbar">
    <div class="topbar-title">
      <h1>Dashboard</h1>
      <p>Overview of your opportunities and student activity</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/index" class="view-site" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i> View Site</a>
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar"><i class="fa-solid fa-bars"></i></button>
    </div>
  </header>

  <div class="content">
    <c:if test="${param.error == 'not-approved'}">
      <div class="panel"><p>Your organizer account must be approved before you can publish opportunities.</p></div>
    </c:if>

    <div class="stats-grid">
      <div class="stat-card"><div class="stat-icon blue"><i class="fa-solid fa-file-lines"></i></div><div class="stat-info"><h3>${empty applications ? 0 : applications.size()}</h3><p>Total Applications</p></div></div>
      <div class="stat-card"><div class="stat-icon amber"><i class="fa-solid fa-calendar-check"></i></div><div class="stat-info"><h3>${empty registrations ? 0 : registrations.size()}</h3><p>Workshop Registrations</p></div></div>
      <div class="stat-card"><div class="stat-icon green"><i class="fa-solid fa-circle-check"></i></div><div class="stat-info"><h3>${empty organizer || !organizer.approved ? 'Pending' : 'Approved'}</h3><p>Account Status</p></div></div>
    </div>

    <div class="panel">
      <div class="panel-header"><h2>Recent Applications</h2><a href="${cp}/organizer/applications" class="btn btn-sm btn-outline">View All</a></div>
      <div class="overflow-x-auto">
        <table>
          <thead><tr><th>Applicant</th><th>Internship</th><th>Applied</th><th>Status</th></tr></thead>
          <tbody>
          <c:forEach items="${applications}" var="application" varStatus="loop">
            <c:if test="${loop.index < 5}">
              <tr>
                <td><strong><c:out value="${application.student.firstName}"/> <c:out value="${application.student.lastName}"/></strong></td>
                <td><c:out value="${application.internship.title}"/></td>
                <td><c:out value="${application.appliedAt}"/></td>
                <td><span class="status-${application.status.name().toLowerCase()}"><c:out value="${application.status}"/></span></td>
              </tr>
            </c:if>
          </c:forEach>
          <c:if test="${empty applications}"><tr><td colspan="4">No applications received yet.</td></tr></c:if>
          </tbody>
        </table>
      </div>
    </div>

    <div class="panel">
      <div class="panel-header"><h2>Recent Registrations</h2><a href="${cp}/organizer/registrations" class="btn btn-sm btn-outline">View All</a></div>
      <div class="overflow-x-auto">
        <table>
          <thead><tr><th>Student</th><th>Workshop</th><th>Registered</th><th>Status</th></tr></thead>
          <tbody>
          <c:forEach items="${registrations}" var="registration" varStatus="loop">
            <c:if test="${loop.index < 5}">
              <tr>
                <td><strong><c:out value="${registration.student.firstName}"/> <c:out value="${registration.student.lastName}"/></strong></td>
                <td><c:out value="${registration.workshop.title}"/></td>
                <td><c:out value="${registration.registeredAt}"/></td>
                <td><span class="status-${registration.status.name().toLowerCase()}"><c:out value="${registration.status}"/></span></td>
              </tr>
            </c:if>
          </c:forEach>
          <c:if test="${empty registrations}"><tr><td colspan="4">No workshop registrations yet.</td></tr></c:if>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script src="${cp}/assets/js/organizer.js"></script>
</body>
</html>
