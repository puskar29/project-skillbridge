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

<!-- Workshops Section -->
<section class="ws-section">
  <div class="opportunities-header">
    <h4>Upcoming Sessions</h4>
    <h1>Featured Workshops</h1>
    <p>Join live sessions and grow your skills with hands-on practice.</p>
  </div>

  <div class="opp-tabs">
    <button class="opp-tab active" data-filter="all">All</button>
    <button class="opp-tab" data-filter="beginner">Beginner</button>
    <button class="opp-tab" data-filter="intermediate">Intermediate</button>
    <button class="opp-tab" data-filter="online">Online</button>
  </div>

  <!-- Cards — demo data hardcoded, filter reads the classes -->
  <div class="ws-grid" id="ws-grid">

    <c:choose>
      <c:when test="${not empty workshops}">
        <c:forEach items="${workshops}" var="ws">
          <article class="ws-card ${ws.level != null ? ws.level.name().toLowerCase() : ''} ${ws.location != null && ws.location.toLowerCase().contains('online') ? 'online' : ''}"
                   data-summary="${ws.description}">
            <div class="ws-date-box">
              <span class="ws-date-day">${ws.deadline != null ? ws.deadline.dayOfMonth : '15'}</span>
              <span class="ws-date-month">${ws.deadline != null ? ws.deadline.month : 'NOV'}</span>
            </div>
            <div class="ws-body">
              <span class="ws-badge"><c:out value="${not empty ws.category ? ws.category : 'General'}" /></span>
              <h3 class="ws-title"><c:out value="${ws.title}" /></h3>
              <p class="ws-trainer"><i class="fa-solid fa-user-tie"></i> <c:out value="${ws.organizer}" /></p>
              <div class="ws-meta">
                <span><i class="fa-solid fa-location-dot"></i> <c:out value="${ws.location}" /></span>
                <span><i class="fa-regular fa-clock"></i> <c:out value="${ws.duration}" /></span>
              </div>
              <div class="ws-card-bottom">
                <span class="ws-level"><c:out value="${ws.level != null ? ws.level.displayName : 'All Levels'}" /></span>
                <a href="javascript:void(0)" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
              </div>
            </div>
          </article>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="empty-state">
          <p>No upcoming workshops at the moment.</p>
        </div>
      </c:otherwise>
    </c:choose>

  </div>

  <div class="opp-list">
    <div class="empty-state is-hidden" id="ws-empty">
      <span class="empty-icon"><i class="fa-solid fa-chalkboard-user"></i></span>
      <h3>No Workshops Found</h3>
      <p>There are no workshops in this category right now.<br>Check back again soon.</p>
    </div>
  </div>
</section>

<!-- Workshops CTA -->
<section class="ws-cta">
  <div class="ws-cta-box">
    <h2>Ready to Level Up?</h2>
    <p>Create an account to register for workshops and get notified about new ones.</p>
    <div class="cta-buttons">
      <a href="${cp}/signup" class="btn btn-primary">Get Started <i class="fa-solid fa-arrow-right"></i></a>
    </div>
  </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${cp}/assets/js/navbar.js"></script>
<script src="${cp}/assets/js/filters.js"></script>
<script src="${cp}/assets/js/apply-modal.js"></script>

</body>

</html>