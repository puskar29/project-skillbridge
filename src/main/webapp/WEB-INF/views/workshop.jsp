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

    <article class="ws-card beginner online" data-summary="Eight weeks from your first line of HTML to deployed JavaScript apps — you'll finish with three portfolio-ready projects.">
      <div class="ws-date-box">
        <span class="ws-date-day">14</span>
        <span class="ws-date-month">NOV</span>
      </div>
      <div class="ws-body">
        <span class="ws-badge">Web</span>
        <h3 class="ws-title">Web Development Bootcamp</h3>
        <p class="ws-trainer"><i class="fa-solid fa-user-tie" aria-hidden="true"></i> Himalayan Labs</p>
        <div class="ws-meta">
          <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> Online</span>
          <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 8 weeks</span>
        </div>
        <div class="ws-card-bottom">
          <span class="ws-level">Beginner</span>
          <a href="${cp}/signup" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </article>

    <article class="ws-card intermediate" data-summary="Six weeks of pandas, visualization and introductory modelling through live, project-based sessions.">
      <div class="ws-date-box">
        <span class="ws-date-day">5</span>
        <span class="ws-date-month">DEC</span>
      </div>
      <div class="ws-body">
        <span class="ws-badge">Data</span>
        <h3 class="ws-title">Data Science with Python</h3>
        <p class="ws-trainer"><i class="fa-solid fa-user-tie" aria-hidden="true"></i> Everest Analytics</p>
        <div class="ws-meta">
          <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> Kathmandu</span>
          <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 6 weeks</span>
        </div>
        <div class="ws-card-bottom">
          <span class="ws-level">Intermediate</span>
          <a href="${cp}/signup" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </article>

    <article class="ws-card beginner online" data-summary="Four weeks covering research, wireframes and high-fidelity prototypes in Figma, ending with a real client brief.">
      <div class="ws-date-box">
        <span class="ws-date-day">12</span>
        <span class="ws-date-month">DEC</span>
      </div>
      <div class="ws-body">
        <span class="ws-badge">Design</span>
        <h3 class="ws-title">UI/UX Design Crash Course</h3>
        <p class="ws-trainer"><i class="fa-solid fa-user-tie" aria-hidden="true"></i> Craft Nepal</p>
        <div class="ws-meta">
          <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> Online</span>
          <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 4 weeks</span>
        </div>
        <div class="ws-card-bottom">
          <span class="ws-level">Beginner</span>
          <a href="${cp}/signup" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </article>

    <article class="ws-card beginner" data-summary="Branching, pull requests and team collaboration habits explained simply — everything you need to contribute to any repository.">
      <div class="ws-date-box">
        <span class="ws-date-day">21</span>
        <span class="ws-date-month">NOV</span>
      </div>
      <div class="ws-body">
        <span class="ws-badge">Git</span>
        <h3 class="ws-title">Git &amp; GitHub Essentials</h3>
        <p class="ws-trainer"><i class="fa-solid fa-user-tie" aria-hidden="true"></i> CloudKite</p>
        <div class="ws-meta">
          <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> Kathmandu</span>
          <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 1 day</span>
        </div>
        <div class="ws-card-bottom">
          <span class="ws-level">Beginner</span>
          <a href="${cp}/signup" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </article>

    <article class="ws-card intermediate online" data-summary="Hooks composition, state modelling and performance techniques for React developers who already know the basics.">
      <div class="ws-date-box">
        <span class="ws-date-day">9</span>
        <span class="ws-date-month">JAN</span>
      </div>
      <div class="ws-body">
        <span class="ws-badge">React</span>
        <h3 class="ws-title">Advanced React Patterns</h3>
        <p class="ws-trainer"><i class="fa-solid fa-user-tie" aria-hidden="true"></i> Sagarmatha Soft</p>
        <div class="ws-meta">
          <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> Online</span>
          <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 5 weeks</span>
        </div>
        <div class="ws-card-bottom">
          <span class="ws-level">Intermediate</span>
          <a href="${cp}/signup" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </article>

    <article class="ws-card intermediate" data-summary="Containers, networking and deployment on a real cloud account — you'll go from Docker image to live service.">
      <div class="ws-date-box">
        <span class="ws-date-day">23</span>
        <span class="ws-date-month">JAN</span>
      </div>
      <div class="ws-body">
        <span class="ws-badge">Cloud</span>
        <h3 class="ws-title">Cloud Infrastructure Bootcamp</h3>
        <p class="ws-trainer"><i class="fa-solid fa-user-tie" aria-hidden="true"></i> CloudKite</p>
        <div class="ws-meta">
          <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> Lalitpur</span>
          <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 10 weeks</span>
        </div>
        <div class="ws-card-bottom">
          <span class="ws-level">Intermediate</span>
          <a href="${cp}/signup" class="ws-apply">Register <i class="fa-solid fa-arrow-right"></i></a>
        </div>
      </div>
    </article>

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