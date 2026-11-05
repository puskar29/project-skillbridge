<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 6:23 PM
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

<section class="about-page-hero">
  <h4 class="about-eyebrow">Who We Are</h4>
  <h1>About SkillBridge</h1>
  <p>
    Bridging students to real-world opportunities — one application at a time.
  </p>
</section>

<!-- Mission -->
<section class="about-page-mission">
  <div class="about-page-mission-inner">
    <div class="about-page-mission-text">
      <h4>Our Mission</h4>
      <h2>We Connect Students With Opportunities That Build Their Future</h2>
      <p>
        SkillBridge is a web-based Student Event and Opportunity Management System that brings internships, workshops
        registrations together in one easy-to-use platform for students.
      </p>
      <p>
        We believe every student deserves a clear path to real-world experience. Our platform makes it easy to
        discover, apply to, and track opportunities that match your skills, interests and goals.
      </p>
    </div>
    <div class="about-page-mission-visual">
      <div class="about-page-circle">
        <i class="fa-solid fa-graduation-cap"></i>
      </div>
    </div>
  </div>
</section>

<!-- Values -->
<section class="about-page-values">
  <div class="about-page-values-inner">
    <div class="about-page-values-header">
      <h4>Our Values</h4>
      <h1>What We Stand For</h1>
      <p>The principles that guide every decision we make.</p>
    </div>
    <div class="about-page-values-grid">
      <div class="about-page-value-card">
          <span class="icon">
            <i class="fa-solid fa-shield-halved"></i>
          </span>
        <h3>Trust</h3>
        <p>We only list verified opportunities from partners we trust.</p>
      </div>
      <div class="about-page-value-card">
          <span class="icon">
            <i class="fa-solid fa-scale-balanced"></i>
          </span>
        <h3>Equality</h3>
        <p>Every student gets a fair chance, regardless of background.</p>
      </div>
      <div class="about-page-value-card">
          <span class="icon">
            <i class="fa-solid fa-lightbulb"></i>
          </span>
        <h3>Growth</h3>
        <p>We help students grow by pushing them toward real challenges.</p>
      </div>
      <div class="about-page-value-card">
          <span class="icon">
            <i class="fa-solid fa-handshake"></i>
          </span>
        <h3>Collaboration</h3>
        <p>We work closely with companies and educators to serve students.</p>
      </div>
    </div>
  </div>
</section>

<!-- CTA -->
<section class="about-page-cta-section">
  <div class="about-page-cta-inner">
    <div class="about-page-cta-box">
      <h2>Ready to Take the Next Step?</h2>
      <p>
        Create your free account and start discovering opportunities today.
      </p>
      <div class="about-page-cta-actions">
        <a href="${cp}/signup" class="about-page-cta-btn about-page-cta-btn-light">
          Get Started <i class="fa-solid fa-arrow-right"></i>
        </a>
        <a href="${cp}/contact" class="about-page-cta-btn about-page-cta-btn-outline">
          Contact Us
        </a>
      </div>
    </div>
  </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${cp}/assets/js/navbar.js"></script>

</body>

</html>