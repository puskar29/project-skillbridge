<%--
  Shared footer partial.
  Include it at the end of <body> with: <jsp:include page="footer.jsp"></jsp:include>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<footer class="main-footer">
  <div class="footer-inner">
    <div class="footer-brand">
      <a href="${cp}/index" class="logo">
        <img src="${cp}/assets/images/logo-skillbridge.png" alt="SkillBridge logo">
        <span class="logo-text">Skill<span>Bridge</span></span>
      </a>
      <p>Bridging students to real-world opportunities — internships, workshops, hackathons and more.</p>
      <div class="footer-social">
        <a href="#" aria-label="Facebook"><i class="fa-brands fa-facebook"></i></a>
        <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin"></i></a>
        <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
      </div>
    </div>

    <div class="footer-col">
      <h4>Platform</h4>
      <ul>
        <li><a href="${cp}/index">Home</a></li>
        <li><a href="${cp}/opportunity">Opportunities</a></li>
        <li><a href="${cp}/internship">Internships</a></li>
        <li><a href="${cp}/workshop">Workshops</a></li>
      </ul>
    </div>

    <div class="footer-col">
      <h4>Company</h4>
      <ul>
        <li><a href="${cp}/about">About Us</a></li>
        <li><a href="${cp}/contact">Contact</a></li>
        <li><a href="#">Careers</a></li>
        <li><a href="#">Blog</a></li>
      </ul>
    </div>

    <div class="footer-col">
      <h4>Legal</h4>
      <ul>
        <li><a href="#">Terms of Service</a></li>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Cookie Policy</a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <p>© 2026 SkillBridge. All rights reserved.</p>
  </div>
</footer>
