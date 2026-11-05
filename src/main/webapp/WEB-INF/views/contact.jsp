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

<section class="contact-hero">
  <h4>GET IN TOUCH</h4>
  <h1>Contact Us</h1>
  <p>Have a question or want to work together? We'd love to hear from you.</p>
</section>

<!-- Contact Section -->
<section class="contact-section">
  <div class="contact-container">

    <div class="contact-form-wrapper">
      <!-- No backend — js/contact.js handles submit -->
      <form class="contact-form" id="contactForm" novalidate>

        <div class="form-header">
          <div class="form-header-icon">
            <i class="fa-solid fa-paper-plane" aria-hidden="true"></i>
          </div>
          <div class="form-header-text">
            <h2>Send us a message</h2>
            <p>Fields marked with <span class="req" aria-hidden="true">*</span> are required.</p>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="name">Full Name <span class="req" aria-hidden="true">*</span></label>
            <div class="input-wrapper">
              <i class="fa-solid fa-user" aria-hidden="true"></i>
              <input type="text" id="name" name="name" placeholder="Your Name" autocomplete="name"
                     required minlength="2" maxlength="80" aria-describedby="name-error">
            </div>
            <p class="field-error" id="name-error"></p>
          </div>

          <div class="form-group">
            <label for="email">Email Address <span class="req" aria-hidden="true">*</span></label>
            <div class="input-wrapper">
              <i class="fa-solid fa-envelope" aria-hidden="true"></i>
              <input type="email" id="email" name="email" placeholder="name@example.com"
                     autocomplete="email" required maxlength="120" aria-describedby="email-error">
            </div>
            <p class="field-error" id="email-error"></p>
          </div>
        </div>

        <div class="form-group">
          <label for="subject">Topic <span class="req" aria-hidden="true">*</span></label>
          <div class="input-wrapper select-wrapper">
            <i class="fa-solid fa-layer-group" aria-hidden="true"></i>
            <select id="subject" name="subject" required aria-describedby="subject-error">
              <option value="" selected disabled>Choose a topic…</option>
              <option value="general">General inquiry</option>
              <option value="internships">Internships &amp; opportunities</option>
              <option value="workshops">Workshops &amp; events</option>
              <option value="partnership">Partnership</option>
              <option value="support">Technical support</option>
              <option value="feedback">Feedback</option>
            </select>
            <i class="fa-solid fa-chevron-down select-chevron" aria-hidden="true"></i>
          </div>
          <p class="field-error" id="subject-error"></p>
        </div>

        <div class="form-group">
          <label for="message">Message <span class="req" aria-hidden="true">*</span></label>
          <div class="input-wrapper textarea-wrapper">
            <i class="fa-solid fa-comment-dots" aria-hidden="true"></i>
            <textarea id="message" name="message" rows="7" placeholder="Tell us how we can help…"
                      required minlength="20" maxlength="1000"
                      aria-describedby="message-error"></textarea>
          </div>
          <p class="field-error" id="message-error"></p>
        </div>

        <button type="submit" class="submit-btn">
          Send Message
          <i class="fa-solid fa-paper-plane" aria-hidden="true"></i>
        </button>

        <p class="form-note">
          <i class="fa-solid fa-lock" aria-hidden="true"></i>
          Your details stay private and are only used to reply.
        </p>
      </form>
    </div>

  </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${cp}/assets/js/navbar.js"></script>
<script src="${cp}/assets/js/contact.js"></script>

</body>

</html>