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

  <!-- Cards — demo data hardcoded, js/filters.js reads the classes -->
  <div class="opp-grid" id="opp-grid">

    <article class="opp-card internship" data-summary="Build and ship interfaces for client web apps with React, work alongside senior developers, and get weekly feedback on your code.">
      <div class="opp-card-top">
        <span class="opp-badge">Internship</span>
        <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
      </div>
      <h3 class="opp-title">Frontend Developer Intern</h3>
      <p class="opp-company">Himalayan Labs</p>
      <div class="opp-meta">
        <span><i class="fa-solid fa-location-dot"></i> Kathmandu</span>
        <span><i class="fa-solid fa-briefcase"></i> Full Time</span>
        <span><i class="fa-regular fa-clock"></i> 3 months</span>
      </div>
      <div class="opp-card-bottom">
        <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: Nov 30, 2026</span>
        <a href="${cp}/signup" class="opp-apply">Apply <i class="fa-solid fa-arrow-right"></i></a>
      </div>
    </article>

    <article class="opp-card internship" data-summary="Design REST APIs and work with PostgreSQL on a remote-first team — a great fit if you know Node.js or are eager to learn it.">
      <div class="opp-card-top">
        <span class="opp-badge">Internship</span>
        <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
      </div>
      <h3 class="opp-title">Backend Developer Intern</h3>
      <p class="opp-company">Sagarmatha Soft</p>
      <div class="opp-meta">
        <span><i class="fa-solid fa-location-dot"></i> Remote</span>
        <span><i class="fa-solid fa-briefcase"></i> Full Time</span>
        <span><i class="fa-regular fa-clock"></i> 6 months</span>
      </div>
      <div class="opp-card-bottom">
        <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: Dec 15, 2026</span>
        <a href="${cp}/signup" class="opp-apply">Apply <i class="fa-solid fa-arrow-right"></i></a>
      </div>
    </article>

    <article class="opp-card internship" data-summary="Turn raw datasets into dashboards and reports using Python and SQL, and present your findings directly to the analytics team.">
      <div class="opp-card-top">
        <span class="opp-badge">Internship</span>
        <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
      </div>
      <h3 class="opp-title">Data Analyst Intern</h3>
      <p class="opp-company">Everest Analytics</p>
      <div class="opp-meta">
        <span><i class="fa-solid fa-location-dot"></i> Kathmandu</span>
        <span><i class="fa-solid fa-briefcase"></i> Part Time</span>
        <span><i class="fa-regular fa-clock"></i> 4 months</span>
      </div>
      <div class="opp-card-bottom">
        <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: Jan 20, 2027</span>
        <a href="${cp}/signup" class="opp-apply">Apply <i class="fa-solid fa-arrow-right"></i></a>
      </div>
    </article>

    <article class="opp-card workshop" data-summary="Eight weeks of hands-on HTML, CSS and JavaScript — you'll finish with three portfolio-ready projects.">
      <div class="opp-card-top">
        <span class="opp-badge">Workshop</span>
        <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
      </div>
      <h3 class="opp-title">Web Development Bootcamp</h3>
      <p class="opp-company">Himalayan Labs</p>
      <div class="opp-meta">
        <span><i class="fa-solid fa-location-dot"></i> Online</span>
        <span><i class="fa-solid fa-chalkboard-user"></i> Beginner</span>
        <span><i class="fa-regular fa-clock"></i> 8 weeks</span>
      </div>
      <div class="opp-card-bottom">
        <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: Nov 10, 2026</span>
        <a href="${cp}/signup" class="opp-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
      </div>
    </article>

    <article class="opp-card workshop" data-summary="Learn pandas, visualization and basic modelling through live, project-based sessions over six weeks.">
      <div class="opp-card-top">
        <span class="opp-badge">Workshop</span>
        <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
      </div>
      <h3 class="opp-title">Data Science with Python</h3>
      <p class="opp-company">Everest Analytics</p>
      <div class="opp-meta">
        <span><i class="fa-solid fa-location-dot"></i> Kathmandu</span>
        <span><i class="fa-solid fa-chalkboard-user"></i> Intermediate</span>
        <span><i class="fa-regular fa-clock"></i> 6 weeks</span>
      </div>
      <div class="opp-card-bottom">
        <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: Nov 25, 2026</span>
        <a href="${cp}/signup" class="opp-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
      </div>
    </article>

    <article class="opp-card workshop" data-summary="Four weeks covering research, wireframes and high-fidelity prototypes in Figma, ending with a real client brief.">
      <div class="opp-card-top">
        <span class="opp-badge">Workshop</span>
        <span class="opp-bookmark" aria-hidden="true"><i class="fa-regular fa-bookmark"></i></span>
      </div>
      <h3 class="opp-title">UI/UX Design Crash Course</h3>
      <p class="opp-company">Craft Nepal</p>
      <div class="opp-meta">
        <span><i class="fa-solid fa-location-dot"></i> Online</span>
        <span><i class="fa-solid fa-chalkboard-user"></i> Beginner</span>
        <span><i class="fa-regular fa-clock"></i> 4 weeks</span>
      </div>
      <div class="opp-card-bottom">
        <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: Dec 05, 2026</span>
        <a href="${cp}/signup" class="opp-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
      </div>
    </article>

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
<script src="${cp}/assets/js/apply-modal.js"></script>

</body>

</html>