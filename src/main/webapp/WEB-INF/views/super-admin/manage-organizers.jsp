<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Organizers | Admin | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- tailwind css -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="${cp}/assets/css/admin.css">
</head>

<body>
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<jsp:include page="admin-sidebar.jsp">
  <jsp:param name="activePage" value="organizers"/>
</jsp:include>

<div class="main-area">
  <header class="topbar">
    <div class="topbar-title">
      <h1>Manage Organizers</h1>
      <p>Review and approve program providers who registered</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/home" class="view-site" target="_blank">
        <i class="fa-solid fa-arrow-up-right-from-square"></i> View Site
      </a>
      <img src="${cp}/assets/images/pfp.png" class="admin-avatar" alt="Admin profile picture">
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar">
        <i class="fa-solid fa-bars"></i>
      </button>
    </div>
  </header>

  <div class="content">
    <div class="panel">
      <div class="panel-header">
        <h2>Registered Organizers</h2>
        <div class="panel-actions">
          <span class="text-sm text-gray-500">Organizer management</span>
        </div>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm [&_th]:whitespace-nowrap [&_th]:border-b [&_th]:border-[#90caf9] [&_th]:bg-[#e3f2fd] [&_th]:px-3.5 [&_th]:py-3 [&_th]:text-left [&_th]:font-heading [&_th]:text-[11px] [&_th]:font-semibold [&_th]:uppercase [&_th]:tracking-wider [&_th]:text-[#546e7e] [&_td]:border-b [&_td]:border-[#e3f2fd] [&_td]:px-3.5 [&_td]:py-3.5 [&_td]:align-middle [&_td]:text-[#0d47a1] [&_tr:last-child_td]:border-b-0 [&_tbody_tr:hover_td]:bg-[#e3f2fd]">
          <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Organization</th>
            <th>Registered</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody id="organizersBody">
          <c:forEach items="${organizers}" var="organizer">
            <tr>
              <td><strong><c:out value="${organizer.firstName}"/> <c:out value="${organizer.lastName}"/></strong></td>
              <td><c:out value="${organizer.email}"/></td>
              <td><c:out value="${organizer.organizationName}"/></td>
              <td><c:out value="${organizer.createdAt}"/></td>
              <td>
                <c:choose>
                  <c:when test="${organizer.approved}"><span class="status-approved">Approved</span></c:when>
                  <c:when test="${not organizer.enabled}"><span class="status-rejected">Rejected</span></c:when>
                  <c:otherwise><span class="status-pending">Pending</span></c:otherwise>
                </c:choose>
              </td>
              <td>
                <div class="flex items-center gap-1.5 whitespace-nowrap">
                  <form method="post" action="${cp}/admin/organizers/${organizer.id}/status" style="display:inline">
                    <input type="hidden" name="approved" value="true">
                    <button type="submit" title="Approve" class="grid h-8 w-8 place-items-center rounded-lg border border-emerald-500 bg-emerald-500 text-white"><i class="fa-solid fa-check"></i></button>
                  </form>
                  <form method="post" action="${cp}/admin/organizers/${organizer.id}/status" style="display:inline">
                    <input type="hidden" name="approved" value="false">
                    <button type="submit" title="Reject" class="grid h-8 w-8 place-items-center rounded-lg border border-red-500 text-red-500 hover:bg-red-50"><i class="fa-solid fa-xmark"></i></button>
                  </form>
                </div>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty organizers}">
            <tr><td colspan="6">No organizer registrations found.</td></tr>
          </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<jsp:include page="admin-modal.jsp"></jsp:include>

<div class="toast" id="toast">
  <i class="fa-solid fa-circle-check"></i>
  <p id="toastMsg">Saved successfully</p>
</div>

<script src="${cp}/assets/js/admin.js"></script>
</body>
</html>