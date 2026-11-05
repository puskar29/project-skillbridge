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
  <title>Manage Internships | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">

<style>
  .modal-overlay {
    position: fixed;
    inset: 0;
    display: none;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0.45);
    z-index: 1000;
  }
  .modal-overlay.show { display: flex; }

  .modal-box {
    width: 360px;
    max-width: 90vw;
    padding: 20px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    font-family: Inter, sans-serif;
  }
  .modal-box h3 {
    margin: 0 0 8px;
    font-size: 16px;
    font-weight: 600;
    color: #0d47a1;
  }
  .modal-box p {
    margin: 0 0 16px;
    font-size: 13px;
    color: #546e7e;
  }
  .modal-actions {
    display: flex;
    justify-content: flex-end;
    gap: 8px;
  }
  .modal-actions .btn-danger {
    background: #e53935;
    color: #fff;
    border: none;
    padding: 8px 14px;
    border-radius: 8px;
    cursor: pointer;
  }
  .modal-actions .btn-outline {
    background: #fff;
    color: #546e7e;
    border: 1px solid #90caf9;
    padding: 8px 14px;
    border-radius: 8px;
    cursor: pointer;
  }
</style>
</head>

<body>
<!-- Demo data — hardcoded, localStorage keeps your edits -->

<!-- Dark background that appears behind the menu on small screens -->
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR (menu on the left) -->
<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="manage-internships"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Manage Internships</h1>
      <p>View, edit or remove the open positions</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/home" class="view-site" target="_blank">
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
        <h2>All Internships</h2>
        <div class="panel-actions">
          <a href="${cp}/organizer/internship/add" class="btn btn-sm btn-primary">
            <i class="fa-solid fa-plus"></i> Add New
          </a>
        </div>
      </div>
      <div class="table-container">
        <table class="simple-table">
          <thead>
          <tr>
            <th>Title</th>
            <th>Company</th>
            <th>Location</th>
            <th>Type</th>
            <th>Deadline</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody id="manageIntBody">
          <c:forEach var="intern" items="${intern_list}">
          <tr data-id="${intern.id}"
              data-title="${intern.title}"
              data-company="${intern.company}"
              data-description="${intern.description}"
              data-location="${intern.location}"
              data-type="${intern.type}"
              data-duration="${intern.duration}"
              data-stipend="${intern.stipend}"
              data-deadline="${intern.deadline}"
              data-skills="${intern.skills}"
              data-active="${intern.active}">

            <td><strong>${intern.title}</strong></td>
            <td>${intern.company}</td>
            <td>${intern.location}</td>
            <td>${intern.type.displayName}</td>
            <td>${intern.deadline}</td>
            <td>
              <c:choose>
                <c:when test="${intern.active}">
                  <span class="status-active">Active</span>
                </c:when>
                <c:otherwise>
                  <span class="status-draft">Draft</span>
                </c:otherwise>
              </c:choose>
            </td>
            <td>
              <div class="table-actions">
                <a href="${cp}/organizer/internship/edit/${intern.id}" title="Edit"><i class="fa-solid fa-pen"></i></a>
                <a href="javascript:void(0)"
                   onclick="openConfirm('Delete this internship?', 'Are you sure you want to delete this record?', function(){ window.location.href='${cp}/organizer/internship/delete/${intern.id}'; })"><i class="fa-solid fa-trash"></i>
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

<c:if test="${param.success != null}">
  <div class="toast show" id="savedToast">
    <i class="fa-solid fa-circle-check"></i>
    <p>Workshop saved successfully</p>
  </div>
  <script>
    setTimeout(function () {
      var toast = document.getElementById("savedToast");
      if (toast) {
        toast.classList.remove("show");
        setTimeout(function () { toast.remove(); }, 300);
      }
    }, 2700);
  </script>
</c:if>
<!-- Small popup message (showToast in admin.js) -->
<div class="toast" id="toast">
  <i class="fa-solid fa-circle-check"></i>
  <p id="toastMsg">Saved successfully</p>
</div>

<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>