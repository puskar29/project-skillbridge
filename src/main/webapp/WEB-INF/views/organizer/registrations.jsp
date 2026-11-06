<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrations | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css">
  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
</head>
<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>
<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="registrations"/>
</jsp:include>

<div class="main-area">
  <header class="topbar">
    <div class="topbar-title">
      <h1>Registrations</h1>
      <p>Review and manage workshop registrations</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/index" class="view-site" target="_blank">
        <i class="fa-solid fa-arrow-up-right-from-square"></i> View Site
      </a>
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar">
        <i class="fa-solid fa-bars"></i>
      </button>
    </div>
  </header>

  <div class="content">
    <div class="panel">
      <div class="panel-header">
        <h2>Workshop Registrations</h2>
      </div>
      <div class="overflow-x-auto">
        <table>
          <thead>
          <tr>
            <th>Student</th>
            <th>Email</th>
            <th>Workshop</th>
            <th>Registered</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${registrations}" var="registration">
            <tr>
              <td><strong><c:out value="${registration.student.firstName}"/> <c:out value="${registration.student.lastName}"/></strong></td>
              <td><c:out value="${registration.student.email}"/></td>
              <td><c:out value="${registration.workshop.title}"/></td>
              <td><c:out value="${registration.registeredAt}"/></td>
              <td><span class="status-${registration.status.name().toLowerCase()}"><c:out value="${registration.status}"/></span></td>
              <td>
                <c:if test="${registration.status.name() == 'PENDING'}">
                  <div class="decision-actions">
                  <form method="post" class="decision-form" action="${cp}/organizer/registrations/${registration.id}/status">
                    <input type="hidden" name="status" value="CONFIRMED">
                    <button type="submit" class="decision-btn decision-approve" title="Confirm">
                      <i class="fa-solid fa-check"></i><span>Confirm</span>
                    </button>
                  </form>
                  <form method="post" class="decision-form" action="${cp}/organizer/registrations/${registration.id}/status">
                    <input type="hidden" name="status" value="CANCELLED">
                    <button type="submit" class="decision-btn decision-reject" title="Cancel">
                      <i class="fa-solid fa-xmark"></i><span>Cancel</span>
                    </button>
                  </form>
                  </div>
                </c:if>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty registrations}">
            <tr><td colspan="6">No students have registered for your workshops yet.</td></tr>
          </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script src="${cp}/assets/js/organizer.js"></script>
</body>
</html>
