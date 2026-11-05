<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="skillsJoined" value=""/>
<c:forEach var="sk" items="${student.skills}" varStatus="status">
  <c:set var="skillsJoined" value="${skillsJoined}${sk}${not status.last ? ', ' : ''}"/>
</c:forEach>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile | Student | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- tailwind css -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
  <link rel="stylesheet" href="${cp}/assets/css/dashboard.css">
</head>

<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<jsp:include page="student-sidebar.jsp">
  <jsp:param name="activePage" value="profile"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Edit Profile</h1>
      <p>Update your academic, personal, and contact information</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/index" class="view-site" target="_blank">
        <i class="fa-solid fa-arrow-up-right-from-square"></i> View Site
      </a>
      <div class="admin-avatar" title="${student.firstName} ${student.lastName}">
        ${empty student.firstName ? 'S' : student.firstName.substring(0, 1)}
      </div>
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar">
        <i class="fa-solid fa-bars"></i>
      </button>
    </div>
  </header>

  <div class="content">
    <form class="panel form-card" method="post" action="${cp}/student/profile/update">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

      <div class="panel-header">
        <h2>Edit Student Profile</h2>
        <div class="panel-actions">
          <a href="${cp}/student/profile" class="btn btn-sm btn-outline">
            <i class="fa-solid fa-arrow-left"></i> Back to Profile
          </a>
        </div>
      </div>

      <!-- Personal details -->
      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-user"></i> Personal Details
        </div>

        <div class="form-row">
          <div class="field">
            <label for="firstName">First Name <span class="required">*</span></label>
            <input type="text" id="firstName" name="firstName" value="${student.firstName}"
                   maxlength="60" required>
          </div>

          <div class="field">
            <label for="lastName">Last Name <span class="required">*</span></label>
            <input type="text" id="lastName" name="lastName" value="${student.lastName}"
                   maxlength="60" required>
          </div>
        </div>

        <div class="form-row">
          <div class="field">
            <label for="dateOfBirth">Date of Birth</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}">
          </div>

          <div class="field">
            <label for="gender">Gender</label>
            <select id="gender" name="gender">
              <option value="">Select gender</option>
              <option value="MALE" ${student.gender == 'MALE' ? 'selected' : ''}>Male</option>
              <option value="FEMALE" ${student.gender == 'FEMALE' ? 'selected' : ''}>Female</option>
              <option value="OTHER" ${student.gender == 'OTHER' ? 'selected' : ''}>Other</option>
              <option value="PREFER_NOT_TO_SAY" ${student.gender == 'PREFER_NOT_TO_SAY' ? 'selected' : ''}>Prefer not to say</option>
            </select>
          </div>
        </div>
      </div>

      <!-- Academic details -->
      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-graduation-cap"></i> Academic Details
        </div>

        <div class="form-row">
          <div class="field">
            <label for="college">College / University <span class="required">*</span></label>
            <input type="text" id="college" name="college" value="${student.college}"
                   maxlength="120" placeholder="e.g. Tribhuvan University" required>
          </div>

          <div class="field">
            <label for="major">Course / Major <span class="required">*</span></label>
            <input type="text" id="major" name="major" value="${student.major}"
                   maxlength="80" placeholder="e.g. Computer Science" required>
          </div>
        </div>

        <div class="form-row">
          <div class="field">
            <label for="studyYear">Year of Study</label>
            <select id="studyYear" name="studyYear">
              <option value="">Select year of study</option>
              <option value="1" ${student.studyYear == '1' ? 'selected' : ''}>1st Year</option>
              <option value="2" ${student.studyYear == '2' ? 'selected' : ''}>2nd Year</option>
              <option value="3" ${student.studyYear == '3' ? 'selected' : ''}>3rd Year</option>
              <option value="4" ${student.studyYear == '4' ? 'selected' : ''}>4th Year</option>
              <option value="5+" ${student.studyYear == '5+' ? 'selected' : ''}>5th Year+</option>
              <option value="GRADUATE" ${student.studyYear == 'GRADUATE' ? 'selected' : ''}>Graduate</option>
            </select>
          </div>

          <div class="field">
            <label for="graduationYear">Expected Graduation Year</label>
            <input type="number" id="graduationYear" name="graduationYear" value="${student.graduationYear}"
                   min="2020" max="2040" placeholder="e.g. 2028">
          </div>
        </div>
      </div>

      <!-- Skills -->
      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-tags"></i> Technical & Professional Skills
        </div>

        <div class="field">
          <label for="skillsInput">Skills (comma separated)</label>
          <textarea id="skillsInput" name="skillsInput" rows="3"
                    placeholder="e.g. Java, Spring Boot, React, Python, Git">${skillsJoined}</textarea>
          <p class="hint">Separate multiple skills with commas.</p>
        </div>
      </div>

      <!-- Contact details -->
      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-address-book"></i> Contact Information
        </div>

        <div class="form-row">
          <div class="field">
            <label for="email">Email</label>
            <input type="email" id="email" value="${student.email}" readonly>
            <p class="hint">Email is used for signing in and cannot be changed.</p>
          </div>

          <div class="field">
            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" value="${student.phone}"
                   maxlength="20" placeholder="+977 9812345678">
          </div>
        </div>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">
          <i class="fa-solid fa-check"></i> Save Changes
        </button>
        <a href="${cp}/student/profile" class="btn btn-outline">Cancel</a>
      </div>

    </form>
  </div>

</div>

<script>
  function openSidebar() {
    const sb = document.getElementById('sidebar');
    const ov = document.getElementById('sidebarOverlay');
    if (sb) sb.classList.add('open');
    if (ov) ov.classList.add('show');
  }
  function closeSidebar() {
    const sb = document.getElementById('sidebar');
    const ov = document.getElementById('sidebarOverlay');
    if (sb) sb.classList.remove('open');
    if (ov) ov.classList.remove('show');
  }
</script>
</body>

</html>
