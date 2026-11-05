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

<section class="in-hero">
  <span class="in-hero-icon"><i class="fa-solid fa-briefcase"></i></span>
  <h4>Kickstart Your Career</h4>
  <h1>Internships</h1>
  <p>Real work experience at trusted companies — matched to your skills, interests and study year.</p>
</section>

<!-- Internships Section -->
<section class="in-section">
  <div class="opportunities-header">
    <h4>Open Positions</h4>
    <h1>Featured Internships</h1>
    <p>Browse the latest internship openings from our partner companies.</p>
  </div>

  <div class="opp-tabs">
    <button class="opp-tab active" data-filter="all">All</button>
    <button class="opp-tab" data-filter="full">Full-time</button>
    <button class="opp-tab" data-filter="part">Part-time</button>
    <button class="opp-tab" data-filter="remote">Remote</button>
  </div>

  <!-- Cards — demo data hardcoded, js/filters.js reads the classes -->
  <div class="in-grid" id="in-grid">

    <c:choose>
      <c:when test="${not empty internships}">
        <c:forEach items="${internships}" var="intern">
          <article class="in-card ${intern.type != null ? intern.type.name().toLowerCase() : ''} ${intern.location != null && intern.location.toLowerCase().contains('remote') ? 'remote' : ''}"
                   data-summary="${intern.description}">
            <div class="in-card-top">
                <span class="in-badge">
                  <c:out value="${not empty intern.skills ? intern.skills[0] : 'Internship'}" />
                </span>
              <span class="opp-bookmark"><i class="fa-regular fa-bookmark"></i></span>
            </div>
            <h3 class="in-title"><c:out value="${intern.title}" /></h3>
            <p class="in-company"><c:out value="${intern.company}" /></p>
            <div class="in-meta">
              <span><i class="fa-solid fa-location-dot"></i> <c:out value="${intern.location}" /></span>
              <span><i class="fa-solid fa-briefcase"></i> <c:out value="${intern.type.displayName}" /></span>
              <span><i class="fa-regular fa-clock"></i> <c:out value="${intern.duration}" /></span>
            </div>
            <div class="in-extra">
              <span><i class="fa-solid fa-sack-dollar"></i> Stipend: <c:out value="${intern.stipend}" /></span>
            </div>
            <div class="in-card-bottom">
              <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: <c:out value="${intern.deadline}" /></span>
              <a href="javascript:void(0)" class="in-apply">Apply <i class="fa-solid fa-arrow-right"></i></a>
            </div>
          </article>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="empty-state">
          <p>No internships posted yet. Check back soon!</p>
        </div>
      </c:otherwise>
    </c:choose>

  </div>

  <div class="opp-list">
    <div class="empty-state is-hidden" id="in-empty">
      <span class="empty-icon"><i class="fa-solid fa-briefcase"></i></span>
      <h3>No Internships Found</h3>
      <p>There are no internships in this category right now.<br>Check back again soon.</p>
    </div>
  </div>
</section>

<!-- Internships CTA -->
<section class="in-cta">
  <div class="in-cta-box">
    <h2>Don't See Your Dream Role?</h2>
    <p>Create an account to get notified when new internships are posted.</p>
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