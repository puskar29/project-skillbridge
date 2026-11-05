<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="studyYearLabel" value="${student.studyYear}"/>
<c:choose>
  <c:when test="${student.studyYear == '1'}"><c:set var="studyYearLabel" value="1st Year"/></c:when>
  <c:when test="${student.studyYear == '2'}"><c:set var="studyYearLabel" value="2nd Year"/></c:when>
  <c:when test="${student.studyYear == '3'}"><c:set var="studyYearLabel" value="3rd Year"/></c:when>
  <c:when test="${student.studyYear == '4'}"><c:set var="studyYearLabel" value="4th Year"/></c:when>
  <c:when test="${student.studyYear == '5+'}"><c:set var="studyYearLabel" value="5th Year+"/></c:when>
  <c:when test="${student.studyYear == 'GRADUATE'}"><c:set var="studyYearLabel" value="Graduate"/></c:when>
</c:choose>
<c:set var="genderLabel" value="${student.gender}"/>
<c:choose>
  <c:when test="${student.gender == 'MALE'}"><c:set var="genderLabel" value="Male"/></c:when>
  <c:when test="${student.gender == 'FEMALE'}"><c:set var="genderLabel" value="Female"/></c:when>
  <c:when test="${student.gender == 'OTHER'}"><c:set var="genderLabel" value="Other"/></c:when>
  <c:when test="${student.gender == 'PREFER_NOT_TO_SAY'}"><c:set var="genderLabel" value="Prefer not to say"/></c:when>
</c:choose>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Profile | Student | SkillBridge</title>
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

  <style>
    /* Left align, full width (no narrow container), bigger typography */
    .content {
      padding: 32px 40px !important;
    }

    .simple-profile {
      width: 100% !important;
      max-width: 100% !important;
      margin: 0 !important;
      text-align: left !important;
    }

    .simple-profile-head {
      display: flex !important;
      align-items: center !important;
      justify-content: flex-start !important;
      gap: 24px !important;
      padding-bottom: 28px !important;
      border-bottom: 1px solid #e5e7eb !important;
    }

    .simple-profile-photo {
      flex: 0 0 auto !important;
      width: 104px !important;
      height: 104px !important;
      border-radius: 50% !important;
      object-fit: cover !important;
    }

    .simple-profile-identity {
      flex: 1 1 auto !important;
      min-width: 0 !important;
      text-align: left !important;
    }

    .simple-profile-identity h1 {
      font-family: "Poppins", sans-serif !important;
      font-size: 32px !important;
      font-weight: 700 !important;
      color: #111827 !important;
      line-height: 1.25 !important;
      margin: 0 0 6px 0 !important;
    }

    .simple-profile-role {
      font-size: 17px !important;
      color: #4b5563 !important;
      margin: 0 0 6px 0 !important;
    }

    .simple-profile-status {
      font-size: 15px !important;
      color: #6b7280 !important;
      margin: 0 !important;
    }

    .simple-profile-edit {
      margin-left: auto !important;
      flex: 0 0 auto !important;
      display: inline-flex !important;
      align-items: center !important;
      gap: 8px !important;
      padding: 10px 20px !important;
      border: 1px solid #d1d5db !important;
      border-radius: 8px !important;
      background: #ffffff !important;
      color: #111827 !important;
      font-family: "Inter", sans-serif !important;
      font-size: 15px !important;
      font-weight: 600 !important;
      text-decoration: none !important;
      transition: background 0.15s ease !important;
    }

    .simple-profile-edit:hover {
      background: #f3f4f6 !important;
    }

    .simple-section {
      padding: 28px 0 !important;
      border-bottom: 1px solid #e5e7eb !important;
      text-align: left !important;
    }

    .simple-section:last-child {
      border-bottom: 0 !important;
      padding-bottom: 0 !important;
    }

    .simple-section h2 {
      font-family: "Poppins", sans-serif !important;
      font-size: 22px !important;
      font-weight: 600 !important;
      color: #111827 !important;
      margin-bottom: 16px !important;
    }

    .simple-section > p {
      font-size: 16.5px !important;
      line-height: 1.8 !important;
      color: #374151 !important;
      max-width: 950px !important;
      white-space: pre-line !important;
      margin: 0 !important;
    }

    .simple-fields {
      display: flex !important;
      flex-direction: column !important;
      gap: 16px !important;
      margin: 0 !important;
    }

    .simple-field {
      display: flex !important;
      align-items: baseline !important;
      gap: 30px !important;
      font-size: 16.5px !important;
      line-height: 1.6 !important;
      margin: 0 !important;
    }

    .simple-field dt {
      flex: 0 0 240px !important;
      color: #6b7280 !important;
      font-weight: 500 !important;
      font-size: 16px !important;
    }

    .simple-field dd {
      margin: 0 !important;
      color: #111827 !important;
      font-weight: 500 !important;
      font-size: 16.5px !important;
      overflow-wrap: anywhere !important;
    }

    .skill-chip {
      display: inline-flex;
      align-items: center;
      padding: 6px 14px;
      border-radius: 9999px;
      font-size: 14.5px;
      font-weight: 500;
      background: #eff6ff;
      color: #1d4ed8;
      border: 1px solid #bfdbfe;
    }
  </style>
</head>

<body class="student-profile-page">
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<jsp:include page="student-sidebar.jsp">
  <jsp:param name="activePage" value="profile"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Student Profile</h1>
      <p>Your academic and personal information</p>
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

    <c:if test="${param.success != null}">
      <p class="text-sm text-emerald-600 mb-4 font-medium"><i class="fa-solid fa-circle-check"></i> Profile updated successfully.</p>
    </c:if>

    <div class="simple-profile">

      <header class="simple-profile-head">
        <img src="${cp}/assets/images/default-avatar.svg" alt="Profile picture" class="simple-profile-photo">

        <div class="simple-profile-identity">
          <h1>${student.firstName} ${student.lastName}</h1>
          <p class="simple-profile-role">${empty student.major ? 'Student' : student.major}<c:if test="${not empty studyYearLabel}"> &bull; ${studyYearLabel}</c:if></p>
          <p class="simple-profile-status">
            Active Student
            <c:if test="${not empty memberSince}">
              &middot; Member since ${memberSince}
            </c:if>
          </p>
        </div>

        <a href="${cp}/student/profile/edit" class="simple-profile-edit">
          <i class="fa-solid fa-pen"></i> Edit Profile
        </a>
      </header>

      <section class="simple-section">
        <h2>Academic Details</h2>
        <dl class="simple-fields">
          <div class="simple-field">
            <dt>College / University</dt>
            <dd>${empty student.college ? '—' : student.college}</dd>
          </div>

          <div class="simple-field">
            <dt>Course / Major</dt>
            <dd>${empty student.major ? '—' : student.major}</dd>
          </div>

          <div class="simple-field">
            <dt>Year of Study</dt>
            <dd>${empty studyYearLabel ? '—' : studyYearLabel}</dd>
          </div>

          <div class="simple-field">
            <dt>Graduation Year</dt>
            <dd>${empty student.graduationYear ? '—' : student.graduationYear}</dd>
          </div>
        </dl>
      </section>

      <section class="simple-section">
        <h2>Personal Details</h2>
        <dl class="simple-fields">
          <div class="simple-field">
            <dt>Full Name</dt>
            <dd>${student.firstName} ${student.lastName}</dd>
          </div>

          <div class="simple-field">
            <dt>Date of Birth</dt>
            <dd>${empty student.dateOfBirth ? '—' : student.dateOfBirth}</dd>
          </div>

          <div class="simple-field">
            <dt>Gender</dt>
            <dd>${empty genderLabel ? '—' : genderLabel}</dd>
          </div>

          <div class="simple-field">
            <dt>Account Status</dt>
            <dd>Active Student</dd>
          </div>

          <div class="simple-field">
            <dt>Member Since</dt>
            <dd>${empty memberSince ? '—' : memberSince}</dd>
          </div>
        </dl>
      </section>

      <section class="simple-section">
        <h2>Contact Information</h2>
        <dl class="simple-fields">
          <div class="simple-field">
            <dt>Email</dt>
            <dd>${student.email}</dd>
          </div>

          <div class="simple-field">
            <dt>Phone</dt>
            <dd>${empty student.phone ? '—' : student.phone}</dd>
          </div>
        </dl>
      </section>

      <section class="simple-section">
        <h2>Skills</h2>
        <c:choose>
          <c:when test="${not empty student.skills}">
            <div style="display: flex; flex-wrap: wrap; gap: 8px; margin-top: 4px;">
              <c:forEach var="sk" items="${student.skills}">
                <span class="skill-chip"><c:out value="${sk}"/></span>
              </c:forEach>
            </div>
          </c:when>
          <c:otherwise>
            <p>No skills added yet.</p>
          </c:otherwise>
        </c:choose>
      </section>

    </div>

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
