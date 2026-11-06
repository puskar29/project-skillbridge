<%--
  Shared navbar partial.
  Include it inside <body> with: <jsp:include page="navbar.jsp"></jsp:include>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<header class="navbar">
  <div class="nav-inner">
    <a href="${cp}/index" class="logo">
      <img src="${cp}/assets/images/logo-skillbridge.png" alt="logo">
      <span class="logo-text">Skill<span>Bridge</span></span>
    </a>
    <nav class="nav-links">
      <a href="${cp}/index" class="nav-link active">Home</a>
      <div class="dropdown">
        <a href="${cp}/opportunity" class="nav-link dropdown-toggle">Opportunities
          <i class="fa-solid fa-chevron-down chevron"></i>
        </a>
        <div class="dropdown-menu">
          <a href="${cp}/internship">
            <i class="fa-solid fa-briefcase w-4 text-center text-blue-600"></i>&nbsp;&nbsp;Internships</a>
          <a href="${cp}/workshop">
            <i class="fa-solid fa-chalkboard-user w-4 text-center text-blue-600"></i>&nbsp;&nbsp;Workshops</a>
        </div>
      </div>
      <a href="${cp}/about" class="nav-link">About Us</a>
      <a href="${cp}/contact" class="nav-link">Contact</a>
    </nav>
    <div class="auth-buttons">
      <c:choose>

        <%-- Logged-in student --%>
        <c:when test="${not empty student}">
          <a href="${cp}/student/profile" class="profile-link">
            <c:choose>
              <c:when test="${not empty student.profileImage}">
                <img src="${cp}/uploads/profile/${student.profileImage}"
                     alt="${student.firstName} ${student.lastName}"
                     class="navbar-profile-image">
              </c:when>
              <c:otherwise>
                <img src="${cp}/assets/images/pfp.png"
                     alt="Default profile picture"
                     class="navbar-profile-image">
              </c:otherwise>
            </c:choose>
            <span class="navbar-profile-name">${student.firstName}</span>
          </a>

          <form method="post" action="${cp}/logout" class="logout-form">
            <button type="submit" class="logout-btn">
              <i class="fa-solid fa-right-from-bracket"></i>
              <span>Logout</span>
            </button>
          </form>
        </c:when>

        <%-- Logged-in organizer --%>
        <c:when test="${not empty organizer}">
          <a href="${cp}/organizer/profile" class="profile-link">
            <c:choose>
              <c:when test="${not empty organizer.profileImage}">
                <img src="${cp}/uploads/profile/${organizer.profileImage}"
                     alt="${organizer.firstName} ${organizer.lastName}"
                     class="navbar-profile-image">
              </c:when>
              <c:otherwise>
                <img src="${cp}/assets/images/pfp.png"
                     alt="Default profile picture"
                     class="navbar-profile-image">
              </c:otherwise>
            </c:choose>
            <span class="navbar-profile-name">${organizer.firstName}</span>
          </a>

          <form method="post" action="${cp}/logout" class="logout-form">
            <button type="submit" class="logout-btn">
              <i class="fa-solid fa-right-from-bracket"></i>
              <span>Logout</span>
            </button>
          </form>
        </c:when>

        <%-- Guest user --%>
        <c:otherwise>
          <a href="${cp}/login" class="login-btn">Login</a>
          <a href="${cp}/signup" class="signup-btn">Sign Up</a>
        </c:otherwise>

      </c:choose>

      <button class="hamburger" aria-label="Toggle menu">
        <i class="fa-solid fa-bars open"></i>
        <i class="fa-solid fa-xmark close"></i>
      </button>
    </div>
  </div>
  <div class="mobile-menu">
    <nav>
      <a href="${cp}/index" class="nav-link active">Home</a>
      <a href="${cp}/about" class="nav-link">About Us</a>
      <a href="${cp}/contact" class="nav-link">Contact</a>
      <div class="dropdown">
        <a href="${cp}/opportunity" class="nav-link dropdown-toggle">Opportunities
          <i class="fa-solid fa-chevron-down chevron"></i>
        </a>
        <div class="dropdown-menu">
          <a href="${cp}/internship">
            <i class="fa-solid fa-briefcase w-4 text-center text-blue-600"></i>&nbsp;&nbsp;Internships</a>
          <a href="${cp}/workshop">
            <i class="fa-solid fa-chalkboard-user w-4 text-center text-blue-600"></i>&nbsp;&nbsp;Workshops</a>
        </div>
      </div>
    </nav>
  </div>
</header>
