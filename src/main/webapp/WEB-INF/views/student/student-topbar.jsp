<%--
  Shared STUDENT topbar partial.
  Include it inside .main-area with:
  <jsp:include page="student-topbar.jsp"></jsp:include>
  Titles are updated dynamically by the dashboard scripts (ids pageTitle / pageSubtitle).
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<header class="topbar">
  <div class="topbar-title">
    <h1 id="pageTitle">Overview</h1>
    <p id="pageSubtitle">A quick look at your activity</p>
  </div>
  <div class="topbar-actions">
    <a href="${cp}/index" class="view-site" target="_blank">
      <i class="fa-solid fa-arrow-up-right-from-square"></i> View Site
    </a>
    <div class="admin-avatar" title="Asha Rai">A</div>
    <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar">
      <i class="fa-solid fa-bars"></i>
    </button>
  </div>
</header>