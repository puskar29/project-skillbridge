<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile | Organizer | SkillBridge</title>
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
</head>

<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="profile"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Edit Profile</h1>
      <p>Update your organization and contact information</p>
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
    <form class="panel form-card" method="post" action="${cp}/organizer/profile/update">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

      <div class="panel-header">
        <h2>Edit Organization Profile</h2>
        <div class="panel-actions">
          <a href="${cp}/organizer/profile" class="btn btn-sm btn-outline">
            <i class="fa-solid fa-arrow-left"></i> Back to Profile
          </a>
        </div>
      </div>

      <!-- Account holder -->
      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-user"></i> Account Holder
        </div>


        <div class="form-row">
          <div class="field">
            <label for="firstName">First Name <span class="required">*</span></label>
            <input type="text" id="firstName" name="firstName" value="${organizer.firstName}"
                   maxlength="60" required>
          </div>

          <div class="field">
            <label for="lastName">Last Name <span class="required">*</span></label>
            <input type="text" id="lastName" name="lastName" value="${organizer.lastName}"
                   maxlength="60" required>
          </div>
        </div>

        <div class="form-row">
          <div class="field">
            <label for="email">Email</label>
            <input type="email" id="email" value="${organizer.email}" readonly>
            <p class="hint">Email is used for signing in and cannot be changed.</p>
          </div>

          <div class="field">
            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" value="${organizer.phone}"
                   maxlength="20" placeholder="+977 9812345678">
          </div>
        </div>
      </div>

      <!-- Organization details -->
      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-building"></i> Organization Details
        </div>

        <div class="form-row">
          <div class="field">
            <label for="organizationName">Organization Name <span class="required">*</span></label>
            <input type="text" id="organizationName" name="organizationName"
                   value="${organizer.organizationName}" maxlength="120" required>
          </div>

          <div class="field">
            <label for="organizationType">Organization Type</label>
            <select id="organizationType" name="organizationType">
              <option value="">Select type</option>
              <option value="COMPANY" ${organizer.organizationType == 'COMPANY' ? 'selected' : ''}>Company</option>
              <option value="STARTUP" ${organizer.organizationType == 'STARTUP' ? 'selected' : ''}>Startup</option>
              <option value="NGO" ${organizer.organizationType == 'NGO' ? 'selected' : ''}>NGO / Non-profit</option>
              <option value="EDUCATIONAL" ${organizer.organizationType == 'EDUCATIONAL' ? 'selected' : ''}>Educational Institution</option>
              <option value="GOVERNMENT" ${organizer.organizationType == 'GOVERNMENT' ? 'selected' : ''}>Government</option>
              <option value="OTHER" ${organizer.organizationType == 'OTHER' ? 'selected' : ''}>Other</option>
            </select>
          </div>
        </div>

        <div class="form-row">
          <div class="field">
            <label for="position">Your Position in Organization</label>
            <input type="text" id="position" name="position" value="${organizer.position}"
                   maxlength="80" placeholder="e.g. HR Manager, Coordinator">
          </div>

          <div class="field">
            <label for="website">Website</label>
            <input type="url" id="website" name="website" value="${organizer.website}"
                   maxlength="160" placeholder="https://example.com">
          </div>
        </div>

        <div class="field">
          <label for="organizationDescription">About Organization</label>
          <textarea id="organizationDescription" name="organizationDescription" rows="4"
                    placeholder="Brief description about your organization...">${organizer.organizationDescription}</textarea>
        </div>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">
          <i class="fa-solid fa-check"></i> Save Changes
        </button>
        <a href="${cp}/organizer/profile" class="btn btn-outline">Cancel</a>
      </div>

    </form>

    <form class="panel form-card"
          method="post"
          action="${cp}/organizer/profile/photo"
          enctype="multipart/form-data">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

      <div class="form-section">
        <div class="form-section-title">
          <i class="fa-solid fa-camera"></i> Profile Photo
        </div>
        <label for="profileImage">Organizer profile photo</label>
        <input type="file"
               id="profileImage"
               name="profileImage"
               accept=".jpg,.jpeg,.png,.webp"
               required>
        <button type="submit" class="btn btn-primary">Upload Photo</button>
      </div>
    </form>
  </div>

</div>

<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>
