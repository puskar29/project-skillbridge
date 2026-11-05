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
      <div class="admin-avatar" title="Admin">A</div>
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
          <span class="text-sm text-gray-500">Frontend demo — backend coming soon</span>
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
          <tr data-id="1" data-status="pending">
            <td><strong>Himalayan Labs</strong></td>
            <td>contact@himalayanlabs.com</td>
            <td>Himalayan Labs Pvt. Ltd.</td>
            <td>Oct 10, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap">
                <button type="button" title="Approve" class="grid h-8 w-8 place-items-center rounded-lg border border-emerald-500 bg-emerald-500 text-white" onclick="openConfirm('Approve organizer?', 'Approve this organizer to publish opportunities?', function(){ approveOrganizer(1); })"><i class="fa-solid fa-check"></i></button>
                <button type="button" title="Reject" class="grid h-8 w-8 place-items-center rounded-lg border border-red-500 text-red-500 hover:bg-red-50" onclick="openConfirm('Reject organizer?', 'Reject this organizer registration?', function(){ rejectOrganizer(1); })"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="2" data-status="approved">
            <td><strong>Code Himalaya</strong></td>
            <td>info@codehimalaya.org</td>
            <td>Code Himalaya</td>
            <td>Oct 08, 2026</td>
            <td><span class="status-approved">Approved</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap">
                <button type="button" title="View" class="grid h-8 w-8 place-items-center rounded-lg border border-[#90caf9] bg-white text-[#546e7e]"><i class="fa-solid fa-eye"></i></button>
                <button type="button" title="Revoke" class="grid h-8 w-8 place-items-center rounded-lg border border-red-500 text-red-500 hover:bg-red-50" onclick="openConfirm('Revoke organizer?', 'Revoke this organizer account?', function(){ rejectOrganizer(2); })"><i class="fa-solid fa-ban"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="3" data-status="pending">
            <td><strong>Tech Valley</strong></td>
            <td>hello@techvalley.com</td>
            <td>Tech Valley Pvt. Ltd.</td>
            <td>Oct 05, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap">
                <button type="button" title="Approve" class="grid h-8 w-8 place-items-center rounded-lg border border-emerald-500 bg-emerald-500 text-white" onclick="openConfirm('Approve organizer?', 'Approve this organizer to publish opportunities?', function(){ approveOrganizer(3); })"><i class="fa-solid fa-check"></i></button>
                <button type="button" title="Reject" class="grid h-8 w-8 place-items-center rounded-lg border border-red-500 text-red-500 hover:bg-red-50" onclick="openConfirm('Reject organizer?', 'Reject this organizer registration?', function(){ rejectOrganizer(3); })"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
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
<script>
  function updateStatus(id, status) {
    const row = document.querySelector('[data-id="' + id + '"]');
    if (!row) return;
    row.dataset.status = status;
    const cell = row.querySelector('td:nth-child(5)');
    if (cell) {
      const cls = status === 'approved' ? 'status-approved' : (status === 'rejected' ? 'status-rejected' : 'status-pending');
      const label = status.charAt(0).toUpperCase() + status.slice(1);
      cell.innerHTML = '<span class="' + cls + '">' + label + '</span>';
    }
  }
  function approveOrganizer(id) {
    updateStatus(id, 'approved');
    if (typeof showToast === 'function') showToast('Organizer approved');
  }
  function rejectOrganizer(id) {
    updateStatus(id, 'rejected');
    if (typeof showToast === 'function') showToast('Organizer rejected');
  }
</script>
</body>
</html>