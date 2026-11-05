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
  <title>Add Internship | Organizer | SkillBridge</title>
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

<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="add-internship"/>
</jsp:include>


<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Add Internship</h1>
      <p>Publish a new internship for students to apply to</p>
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
        <form id="addInternshipForm" class="panel form-card" method="post" action="${cp}/organizer/internship/edit/${internship.id}">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

          <div class="panel-header">
            <h2 id="intPanelTitle">Update Internship</h2>
          </div>

          <!-- Basic information -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-circle-info"></i> Basic Information
            </div>

            <div class="field">
              <label for="intTitle">Internship Title <span class="required">*</span></label>
              <input type="text" id="intTitle" name="title" value="${internship.title}">
            </div>

            <div class="form-row">
              <div class="field">
                <label>Company / Organization</label>
                <input type="text" value="${organizer.organizationName}" readonly>
                <input type="hidden" name="company" value="${organizer.organizationName}">
              </div>
              <div class="field">
                <label for="intLocation">Location</label>
                <input type="text" id="intLocation" name="location" value="${internship.location}">
              </div>
            </div>
          </div>

          <!-- Details -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-list-check"></i> Details
            </div>

            <div class="field">
              <label for="intDescription">Description</label>
              <textarea id="intDescription" name="description" class="description"
                        >${internship.description}</textarea>
            </div>

            <div class="form-row fields-3">
              <div class="field">
                <label for="intType">Employment Type</label>
                <select id="intType" name="type" class="type">
                  <option value="FULL_TIME" ${internship.type == 'FULL_TIME' ? 'selected' : ''}>Full Time</option>
                  <option value="PART_TIME" ${internship.type == 'PART_TIME' ? 'selected' : ''}>Part Time</option>
                  <option value="CONTRACT" ${internship.type == 'CONTRACT' ? 'selected' : ''}>Contract</option>
                  <option value="REMOTE" ${internship.type == 'REMOTE' ? 'selected' : ''}>Remote</option>
                </select>
              </div>

              <div class="field">
                <label for="intDuration">Duration</label>
                <input type="text" id="intDuration" name="duration" class="duration"
                       value="${internship.duration}">
              </div>

              <div class="field">
                <label for="intStipend">Stipend</label>
                <input type="text" id="intStipend" name="stipend"
                       value="${internship.stipend}">
              </div>
            </div>

            <div class="form-row">
              <div class="field">
                <label for="intDeadline">Application Deadline</label>
                <input type="date" id="intDeadline" name="deadline" value="${internship.deadline}">
              </div>
            </div>
          </div>

          <!-- Required skills -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-layer-group"></i> Required Skills
            </div>

            <div class="field">
              <label for="intSkills">Skills needed</label>
              <textarea id="intSkills" name="skillsText" rows="4"
              >${internship.skillsText}</textarea>
              <p class="hint">Type one skill per line. Commas also work.</p>
            </div>
          </div>


          <!-- Visibility -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-eye"></i> Visibility
            </div>

            <div class="field-switch">
              <div class="visibility-copy">
                <strong>Active internship</strong>
                <span>Allow students to see and apply for this internship.</span>
              </div>

              <label class="visibility-toggle" for="intActive">
                <input type="checkbox"
                       id="intActive"
                  ${internship == null || internship.active ? 'checked' : ''}/>
                <span class="visibility-slider"></span>
              </label>

              <input type="hidden"
                     id="intActiveValue"
                     name="active"
                     value="${internship == null || internship.active ? 'true' : 'false'}"/>
            </div>
          </div>

          <div class="form-actions">
            <button type="submit" class="btn btn-primary" id="intSubmit">
              <i class="fa-solid fa-plus"></i> Update Internship
            </button>
            <a href="${cp}/organizer/internship/manage" class="btn btn-outline">Cancel</a>
          </div>
        </form>

      </div>
    </c:when>

    <c:otherwise>
      <div class="content">
        <form id="addInternshipForm" class="panel form-card" method="post" action="${cp}/organizer/internship/add">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

          <div class="panel-header">
            <h2 id="intPanelTitle">Add Internship</h2>
          </div>

          <!-- Basic information -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-circle-info"></i> Basic Information
            </div>

            <div class="field">
              <label for="intTitle">Internship Title <span class="required">*</span></label>
              <input type="text" id="intTitle" name="title" placeholder="Frontend Developer Intern" required>
            </div>

            <div class="form-row">
              <div class="field">
                <label>Company / Organization</label>
                <input type="text" value="${organizer.organizationName}" readonly>
                <input type="hidden" name="company" value="${organizer.organizationName}">
              </div>
              <div class="field">
                <label for="intLocation">Location</label>
                <input type="text" id="intLocation" name="location" placeholder="Kathmandu or Remote">
              </div>
            </div>
          </div>

          <!-- Details -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-list-check"></i> Details
            </div>

            <div class="field">
              <label for="intDescription">Description</label>
              <textarea id="intDescription" name="description" class="description"
                        placeholder="What the intern will work on, what they will learn, and who they will work with."></textarea>
            </div>

            <div class="form-row fields-3">
              <div class="field">
                <label for="intType">Employment Type</label>
                <select id="intType" name="type" class="type">
                  <option value="FULL_TIME">Full Time</option>
                  <option value="PART_TIME">Part Time</option>
                  <option value="CONTRACT">Contract</option>
                  <option value="REMOTE">Remote</option>
                </select>
              </div>

              <div class="field">
                <label for="intDuration">Duration</label>
                <input type="text" id="intDuration" name="duration" class="duration"
                       placeholder="3 months">
              </div>

              <div class="field">
                <label for="intStipend">Stipend</label>
                <input type="text" id="intStipend" name="stipend"
                       placeholder="NPR 25,000 / month">
              </div>
            </div>

            <div class="form-row">
              <div class="field">
                <label for="intDeadline">Application Deadline</label>
                <input type="date" id="intDeadline" name="deadline">
              </div>
            </div>
          </div>

          <!-- Required skills -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-layer-group"></i> Required Skills
            </div>

            <div class="field">
              <label for="intSkills">Skills needed</label>
              <textarea id="intSkills" name="skillsText" rows="4"
                        placeholder="React&#10;Spring Boot&#10;SQL"></textarea>
              <p class="hint">Type one skill per line. Commas also work.</p>
            </div>
          </div>

          <!-- Visibility -->
          <div class="form-section">
            <div class="form-section-title">
              <i class="fa-solid fa-eye"></i> Visibility
            </div>

            <div class="field-switch">
              <input type="hidden" id="intActiveValue" name="active" value="true" />
              <input type="checkbox" id="intActive" class="active" checked />
              <span>Publish immediately — students can see this internship on the public listing</span>
            </div>
          </div>

          <div class="form-actions">
            <button type="submit" class="btn btn-primary" id="intSubmit">
              <i class="fa-solid fa-plus"></i> Add Internship
            </button>
            <a href="${cp}/organizer/internship/manage" class="btn btn-outline">Cancel</a>
          </div>
        </form>

      </div>
    </c:otherwise>
    
  </c:choose>

</div>

<c:if test="${param.success != null}">
  <div class="toast show" id="savedToast">
    <i class="fa-solid fa-circle-check"></i>
    <p>Internship saved successfully</p>
  </div>

  <script>
    setTimeout(function () {
      var toast = document.getElementById("savedToast");

      if (toast) {
        toast.classList.remove("show");   // fade out

        setTimeout(function () {
          toast.remove();                 // remove from page
        }, 300);
      }
    }, 2700);
  </script>
</c:if>
<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>
