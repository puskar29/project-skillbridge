<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 8:20 PM
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
  <title>Add Workshop | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- tailwind css -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
</head>

<body>
<!-- Own page — admin.js validates and saves this form -->

<!-- Dark background that appears behind the menu on small screens -->
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR (menu on the left) -->
<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="add-workshop"/>
</jsp:include>


<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Add Workshop</h1>
      <p>Schedule a workshop students can register for</p>
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

  <c:choose>
    <c:when test="${edit eq true}">
      <div class="content">

        <form id="addWorkshopForm" class="panel form-card" method="post" action="${cp}/organizer/workshop/edit/${workshop.id}">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <div class="panel-header">
            <h2 id="panelTitle">Update Workshop</h2>
          </div>

          <!-- Basic information -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-circle-info"></i> Basic Information
            </div>

            <div class="field">
              <label for="title">Workshop Title <span class="required">*</span></label>
              <input type="text" id="title" name="title" value="${workshop.title}">
            </div>

            <div class="form-row">
              <div class="field">
                <label>Organizer</label>
                <input type="text" value="${organizer.organizationName}" readonly>
                <input type="hidden" name="organizer" value="${organizer.organizationName}">
              </div>
              <div class="field">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" value="${workshop.location}">
              </div>
            </div>
          </div>

          <!-- Details -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-list-check"></i> Details
            </div>

            <div class="field">
              <label for="description">Description</label>
              <textarea id="description" name="description"
                        >${workshop.description}</textarea>
            </div>

            <div class="form-row fields-3">
              <div class="field">
                <label for="createdAt">Created Date</label>
                <input type="date" id="createdAt" name="createdAt" readonly value="${workshop.createdAt}">
              </div>
              <div class="field">
                <label for="duration">Duration</label>
                <input type="text" id="duration" name="duration" value="${workshop.duration}">
              </div>
              <div class="field">
                <label for="maxParticipants">Max Participants</label>
                <input type="number" id="maxParticipants" name="maxParticipation" min="1" value="${workshop.maxParticipation}">
              </div>
            </div>

            <div class="form-row fields-3">
              <div class="field">
                <label for="level">Level</label>
                <select id="level" name="level">
                  <option value="BEGINNER" ${workshop.level == 'BEGINNER' ? 'selected' : ''}>Beginner</option>
                  <option value="INTERMEDIATE" ${workshop.level == 'INTERMEDIATE' ? 'selected' : ''}>Intermediate</option>
                  <option value="ADVANCE" ${workshop.level == 'ADVANCE' ? 'selected' : ''}>Advanced</option>
                </select>
              </div>
              <div class="field">
                <label for="category">Category</label>
                <input type="text" id="category" name="category"
                       value="${workshop.category}" placeholder="e.g. Web Development">
              </div>
              <div class="field">
                <label for="deadline">Registration Deadline</label>
                <input type="date" id="deadline" name="deadline" value="${workshop.deadline}">
              </div>
            </div>
          </div>

          <!-- Visibility -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-eye"></i> Visibility
            </div>

            <div class="field-switch">
              <div class="visibility-copy">
                <strong>Active workshop</strong>
                <span>Allow students to see and apply for this internship.</span>
              </div>

              <label class="visibility-toggle" for="activeCheckbox">
                <input type="checkbox"
                       id="activeCheckbox"
                  ${workshop.active ? 'checked' : ''}>
                <span class="visibility-slider"></span>
              </label>

              <input type="hidden"
                     id="active"
                     name="active"
                     value="${workshop.active ? 'true' : 'false'}">
            </div>
          </div>

          <div class="form-actions">
            <button type="submit" class="btn btn-primary" id="submit">
              <i class="fa-solid fa-plus"></i> Add Workshop
            </button>
            <a href="${cp}/organizer/workshop/manage" class="btn btn-outline">Cancel</a>
          </div>
        </form>

      </div>
    </c:when>

    <c:otherwise>
      <div class="content">
        <form id="addWorkshopForm" class="panel form-card" method="post" action="${cp}/organizer/workshop/add">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <div class="panel-header">
            <h2 id="panelTitle">Add Workshop</h2>
          </div>

          <!-- Basic information -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-circle-info"></i> Basic Information
            </div>

            <div class="field">
              <label for="title">Workshop Title <span class="required">*</span></label>
              <input type="text" id="title" name="title" placeholder="Enter workshop title">
            </div>

            <div class="form-row">
              <div class="field">
                <label>Organizer</label>
                <input type="text" value="${organizer.organizationName}" readonly>
                <input type="hidden" name="organizer" value="${organizer.organizationName}">
              </div>
              <div class="field">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" placeholder="Online or Kathmandu">
              </div>
            </div>
          </div>

          <!-- Details -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-list-check"></i> Details
            </div>

            <div class="field">
              <label for="description">Description</label>
              <textarea id="description" name="description"
                        placeholder="What students will learn, the format of the sessions, and what they leave with."></textarea>
            </div>

            <div class="form-row fields-3">
              <div class="field">
                <label for="duration">Duration</label>
                <input type="text" id="duration" name="duration" placeholder="6 weeks">
              </div>
              <div class="field">
                <label for="maxParticipants">Max Participants</label>
                <input type="number" id="maxParticipants" name="maxParticipation" min="1" placeholder="30">
              </div>
            </div>

            <div class="form-row fields-3">
              <div class="field">
                <label for="level">Level</label>
                <select id="level" name="level">
                  <option value="BEGINNER">Beginner</option>
                  <option value="INTERMEDIATE">Intermediate</option>
                  <option value="ADVANCE">Advanced</option>
                </select>
              </div>
              <div class="field">
                <label for="category">Category</label>
                <input type="text" id="category" name="category"
                       placeholder="e.g. Web Development">
              </div>
              <div class="field">
                <label for="deadline">Registration Deadline</label>
                <input type="date" id="deadline" name="deadline">
              </div>
            </div>
          </div>

          <!-- Visibility -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-eye"></i> Visibility
            </div>

            <div class="field-switch">
              <input type="checkbox" id="activeCheckbox" checked>
              <input type="hidden" id="active" name="active" value="true">
              <span>Publish immediately — students can register while seats are open</span>
            </div>
          </div>

          <div class="form-actions">
            <button type="submit" class="btn btn-primary" id="submit">
              <i class="fa-solid fa-plus"></i> Add Workshop
            </button>
            <a href="${cp}/organizer/workshop/manage" class="btn btn-outline">Cancel</a>
          </div>
        </form>

      </div>
    </c:otherwise>
  </c:choose>


</div>

<!-- Small popup message (showToast in admin.js) -->
<div class="toast" id="toast">
  <i class="fa-solid fa-circle-check"></i>
  <p id="toastMsg">Saved successfully</p>
</div>

<script>
  const activeCheckbox = document.getElementById("activeCheckbox");
  const activeInput = document.getElementById("active");

  if (activeCheckbox && activeInput) {
    activeCheckbox.addEventListener("change", function () {
      activeInput.value = this.checked ? "true" : "false";
    });
  }
</script>

<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>
