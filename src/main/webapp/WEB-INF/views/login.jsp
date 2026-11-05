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


<main class="auth-main">
  <div class="auth-wrap">
    <div class="auth-card">
      <h1 class="auth-title">Welcome back</h1>
      <p class="auth-sub">Log in to your account</p>

      <c:if test="${param.registered == 'true'}">
        <div class="mb-4 rounded-lg bg-green-50 px-4 py-3 text-sm text-green-700">
          Account created successfully. You can log in now.
        </div>
      </c:if>

      <!-- No backend — js/login.js handles submit -->
      <form id="loginForm" method="post" action="${cp}/login" >

        <div class="field">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="you@example.com"
                 autocomplete="email" required aria-describedby="email-error">
          <p class="field-error" id="email-error"></p>
        </div>

        <div class="field">
          <label for="password">Password</label>
          <div class="password-wrap">
            <input type="password" id="password" name="password" placeholder="Your password"
                   autocomplete="current-password" required aria-describedby="password-error">
            <button type="button" class="toggle-pass" id="togglePass" aria-label="Show password"
                    aria-pressed="false">
              <i class="fa-solid fa-eye" aria-hidden="true"></i>
            </button>
          </div>
          <p class="field-error" id="password-error"></p>
        </div>

        <div class="field-row">
          <label class="checkbox">
            <input type="checkbox" name="remember">
            <span>Remember me</span>
          </label>
          <a href="#" class="forgot-link">Forgot password?</a>
        </div>

        <button type="submit" class="auth-btn">Log In</button>
      </form>

      <p class="auth-alt">
        New to SkillBridge? <a href="${cp}/signup">Create an account</a>
      </p>
    </div>
  </div>
</main>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${cp}/assets/js/navbar.js"></script>
<script src="${cp}/assets/js/login.js"></script>

</body>

</html>