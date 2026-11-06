<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 6:24 PM
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
  <title>SkillBridge | Student Opportunity &amp; Management System</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png" />

  <!-- google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        referrerpolicy="no-referrer" />

  <!-- tailwind cSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- shared theme config — MUST stay AFTER the cdn script above -->
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="${cp}/assets/css/style.css" />
</head>

<body class="font-['Poppins']">
<jsp:include page="navbar.jsp"></jsp:include>

<section class="contact-hero about-hero">
  <h4>Find Your Path</h4>
  <h1>Opportunities</h1>
  <p>Explore internships and workshops that match your skills, interests and goals.</p>
</section>

<!-- Opportunities Section -->
<section class="opportunities-page">
  <div class="opportunities-header">
    <h4>Browse Opportunities</h4>
    <h1>What's Available This Week</h1>
    <p>Use the filters to find the right opportunity for you.</p>
  </div>

  <div class="opp-tabs">
    <button class="opp-tab active" data-filter="all">All</button>
    <button class="opp-tab" data-filter="internship">Internships</button>
    <button class="opp-tab" data-filter="workshop">Workshops</button>
  </div>

  <!-- Cards are loaded from active database opportunities -->
  <div class="opp-grid" id="opp-grid">
    <c:forEach items="${internships}" var="intern">
      <article class="opp-card internship"
               data-summary="<c:out value='${intern.description}'/>">
        <div class="opp-card-top">
          <span class="opp-badge">Internship</span>
          <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
        </div>
        <h3 class="opp-title"><c:out value="${intern.title}"/></h3>
        <p class="opp-company"><c:out value="${intern.company}"/></p>
        <div class="opp-meta">
          <span><i class="fa-solid fa-location-dot"></i> <c:out value="${intern.location}"/></span>
          <span><i class="fa-solid fa-briefcase"></i> <c:out value="${intern.type != null ? intern.type.displayName : 'Internship'}"/></span>
          <span><i class="fa-regular fa-clock"></i> <c:out value="${intern.duration}"/></span>
        </div>
        <div class="opp-card-bottom">
          <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: <c:out value="${intern.deadline}"/></span>
          <c:choose>
            <c:when test="${not empty student}">
              <form method="post"
                    action="${cp}/student/internships/${intern.id}/apply"
                    class="inline-form">
                <button type="submit" class="opp-apply">
                  Apply <i class="fa-solid fa-arrow-right"></i>
                </button>
              </form>
            </c:when>

            <c:otherwise>
              <a href="${cp}/login" class="opp-apply">
                Login to Apply <i class="fa-solid fa-arrow-right"></i>
              </a>
            </c:otherwise>
          </c:choose>
        </div>
      </article>
    </c:forEach>

    <c:forEach items="${workshops}" var="workshop">
      <article class="opp-card workshop"
               data-summary="<c:out value='${workshop.description}'/>">
        <div class="opp-card-top">
          <span class="opp-badge">Workshop</span>
          <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
        </div>
        <h3 class="opp-title"><c:out value="${workshop.title}"/></h3>
        <p class="opp-company"><c:out value="${workshop.organizer}"/></p>
        <div class="opp-meta">
          <span><i class="fa-solid fa-location-dot"></i> <c:out value="${workshop.location}"/></span>
          <span><i class="fa-solid fa-chalkboard-user"></i> <c:out value="${workshop.level != null ? workshop.level.displayName : 'All Levels'}"/></span>
          <span><i class="fa-regular fa-clock"></i> <c:out value="${workshop.duration}"/></span>
        </div>
        <div class="opp-card-bottom">
          <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: <c:out value="${workshop.deadline}"/></span>
          <c:choose>
            <c:when test="${not empty student}">
              <form method="post" action="${cp}/student/workshops/${workshop.id}/register" class="inline-form">
                <button type="submit" class="opp-apply">Register <i class="fa-solid fa-arrow-right"></i></button>
              </form>
            </c:when>
            <c:otherwise>
              <a href="${cp}/login" class="opp-apply">Login to Register <i class="fa-solid fa-arrow-right"></i></a>
            </c:otherwise>
          </c:choose>
        </div>
      </article>
    </c:forEach>

    <c:if test="${empty internships and empty workshops}">
      <div class="empty-state">
        <p>No opportunities have been posted yet. Check back soon!</p>
      </div>
    </c:if>

  </div>

  <div class="opp-list">
    <div class="empty-state is-hidden" id="opp-empty">
      <span class="empty-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
      <h3>No Opportunities Found</h3>
      <p>There are no opportunities in this category right now.<br>Check back again soon.</p>
    </div>
  </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${cp}/assets/js/navbar.js"></script>
<script src="${cp}/assets/js/filters.js"></script>

</body>

</html>