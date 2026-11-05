<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Workshops | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
</head>

<body>
<!-- Demo data — hardcoded, localStorage keeps your edits -->

<!-- Dark background that appears behind the menu on small screens -->
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR (menu on the left) -->
<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="manage-workshops"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Manage Workshops</h1>
      <p>View, edit or remove the upcoming sessions</p>
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
        <h2>All Workshops</h2>
        <div class="panel-actions">
          <a href="${cp}/organizer/workshop/add" class="btn btn-sm btn-primary">
            <i class="fa-solid fa-plus"></i> Add New
          </a>
        </div>
      </div>

      <div class="table-container">
        <table class="simple-table" id="wsGrid">
          <thead>
          <tr>
            <th>Title</th>
            <th>Organizer</th>
            <th>Location</th>
            <th>Category</th>
            <th>Deadline</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="workshop" items="${workshop_list}">
          <tr
               data-id="${workshop.id}"
               data-title="${workshop.title}"
               data-organizer="${workshop.organizer}"
               data-description="${workshop.description}"
               data-location="${workshop.location}"
               data-start="${workshop.createdAt}"
               data-duration="${workshop.duration}"
               data-level="${workshop.level.displayName}"
               data-category="${workshop.category}"
               data-max="${workshop.maxParticipation}"
               data-deadline="${workshop.deadline}"
               data-active="${workshop.active}">
            <td><strong>${workshop.title}</strong></td>
            <td>${workshop.organizer}</td>
            <td>${workshop.location}</td>
            <td>${workshop.category}</td>
            <td>${workshop.deadline}</td>
            <td>
              <c:choose>
                <c:when test="${workshop.active}"><span class="status-active">Active</span></c:when>
                <c:otherwise><span class="status-draft">Draft</span></c:otherwise>
              </c:choose>
            </td>
            <td>
            <div class="table-actions">
              <a href="${cp}/organizer/workshop/edit/${workshop.id}" title="Edit"><i class="fa-solid fa-pen"></i></a>
              <a href="javascript:void(0)"
                 onclick="openConfirm('Delete this workshop?', 'Are you sure you want to delete this record?', function(){ window.location.href='${cp}/organizer/workshop/delete/${workshop.id}'; })"><i class="fa-solid fa-trash"></i>
              </a>
            </div>
            </td>
          </tr>
        </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</div>

<!-- Custom yes/no modal (used by delete and status buttons) -->
<jsp:include page="organizer-modal.jsp"></jsp:include>


<!-- Small popup message (showToast in admin.js) -->
<div class="toast" id="toast">
  <i class="fa-solid fa-circle-check"></i>
  <p id="toastMsg">Saved successfully</p>
</div>

<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>