<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="orgTypeLabel" value="${organizer.organizationType}"/>
<c:choose>
  <c:when test="${organizer.organizationType == 'COMPANY'}"><c:set var="orgTypeLabel" value="Company"/></c:when>
  <c:when test="${organizer.organizationType == 'STARTUP'}"><c:set var="orgTypeLabel" value="Startup"/></c:when>
  <c:when test="${organizer.organizationType == 'NGO'}"><c:set var="orgTypeLabel" value="NGO / Non-profit"/></c:when>
  <c:when test="${organizer.organizationType == 'EDUCATIONAL'}"><c:set var="orgTypeLabel" value="Educational Institution"/></c:when>
  <c:when test="${organizer.organizationType == 'GOVERNMENT'}"><c:set var="orgTypeLabel" value="Government"/></c:when>
  <c:when test="${organizer.organizationType == 'OTHER'}"><c:set var="orgTypeLabel" value="Other"/></c:when>
</c:choose>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Organization Profile | Organizer | SkillBridge</title>
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
      width: 120px !important;
      height: 120px !important;
      border-radius: 50% !important;
      object-fit: cover !important;
      object-position: center !important;
      border: 5px solid #ffffff !important;
      box-shadow: 0 0 0 2px #90caf9, 0 10px 24px rgba(13, 71, 161, 0.18) !important;
      background: #e3f2fd !important;
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

    .simple-field dd a {
      color: #2563eb !important;
      text-decoration: underline !important;
      text-underline-offset: 3px !important;
    }
  </style>
</head>

<body class="organizer-profile-page">
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="profile"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Organization Profile</h1>
      <p>Your organization information</p>
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

    <c:if test="${param.success != null}">
      <p class="text-sm text-emerald-600 mb-4">Profile updated successfully.</p>
    </c:if>

    <div class="simple-profile">

      <header class="simple-profile-head">
        <c:choose>
          <c:when test="${not empty organizer.profileImage}">
            <img src="${cp}/uploads/profile/${organizer.profileImage}"
                 alt="Organizer profile picture"
                 class="simple-profile-photo">
          </c:when>
          <c:otherwise>
            <img src="${cp}/assets/images/default-avatar.svg"
                 alt="Default profile picture"
                 class="simple-profile-photo">
          </c:otherwise>
        </c:choose>

        <div class="simple-profile-identity">
          <h1>${organizer.organizationName}</h1>
          <p class="simple-profile-role">${empty organizer.position ? 'Organizer' : organizer.position}</p>
          <p class="simple-profile-status">
            ${organizer.approved ? 'Approved' : 'Pending approval'}
            <c:if test="${not empty memberSince}">
              &middot; Member since ${memberSince}
            </c:if>
          </p>
        </div>

        <a href="${cp}/organizer/profile/edit" class="simple-profile-edit">
          <i class="fa-solid fa-pen"></i> Edit Profile
        </a>
      </header>

      <section class="simple-section">
        <h2>About</h2>
        <c:choose>
          <c:when test="${not empty organizer.organizationDescription}">
            <p><c:out value="${organizer.organizationDescription}"/></p>
          </c:when>
          <c:otherwise>
            <p>No description added yet.</p>
          </c:otherwise>
        </c:choose>
      </section>

      <section class="simple-section">
        <h2>Organization Details</h2>
        <dl class="simple-fields">
          <div class="simple-field">
            <dt>Organization Name</dt>
            <dd>${organizer.organizationName}</dd>
          </div>

          <div class="simple-field">
            <dt>Type</dt>
            <dd>${empty orgTypeLabel ? '—' : orgTypeLabel}</dd>
          </div>

          <div class="simple-field">
            <dt>Your Position</dt>
            <dd>${empty organizer.position ? '—' : organizer.position}</dd>
          </div>

          <div class="simple-field">
            <dt>Website</dt>
            <dd>
              <c:choose>
                <c:when test="${not empty organizer.website}">
                  <a href="${organizer.website}" target="_blank" rel="noopener noreferrer">${organizer.website}</a>
                </c:when>
                <c:otherwise>—</c:otherwise>
              </c:choose>
            </dd>
          </div>

          <div class="simple-field">
            <dt>Account Status</dt>
            <dd>${organizer.approved ? 'Approved' : 'Pending approval'}</dd>
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
            <dt>Contact Person</dt>
            <dd>${organizer.firstName} ${organizer.lastName}</dd>
          </div>

          <div class="simple-field">
            <dt>Email</dt>
            <dd>${organizer.email}</dd>
          </div>

          <div class="simple-field">
            <dt>Phone</dt>
            <dd>${empty organizer.phone ? '—' : organizer.phone}</dd>
          </div>
        </dl>
      </section>

    </div>

  </div>
</div>

<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>
