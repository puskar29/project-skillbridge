<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 8:20 PM
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
  <title>Applications | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- tailwind css — the table below is styled with utilities from here -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <!-- css — everything except the table -->
  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
</head>

<body>
<!-- Demo data — hardcoded, localStorage keeps your edits -->

<!-- Dark background that appears behind the menu on small screens -->
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR (menu on the left) -->
<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="applications"/>
</jsp:include>


<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Applications</h1>
      <p>Review and approve internship applications</p>
    </div>
    <div class="topbar-actions">
      <a href="${cp}/index" class="view-site" target="_blank">
        <i class="fa-solid fa-arrow-up-right-from-square"></i> View Site
      </a>
      <button class="hamburger-btn" onclick="openSidebar()" aria-label="Toggle sidebar">
        <i class="fa-solid fa-bars"></i>
      </button>
    </div>
  </header>

  <div class="content">

    <div class="type-tabs" role="tablist">
      <button type="button" class="type-tab active" data-filter="all" onclick="filterStatus(this, 'appsBody')">All</button>
      <button type="button" class="type-tab" data-filter="pending" onclick="filterStatus(this, 'appsBody')">Pending</button>
      <button type="button" class="type-tab" data-filter="approved" onclick="filterStatus(this, 'appsBody')">Approved</button>
      <button type="button" class="type-tab" data-filter="rejected" onclick="filterStatus(this, 'appsBody')">Rejected</button>
      <button type="button" class="type-tab" data-filter="waitlist" onclick="filterStatus(this, 'appsBody')">Waitlist</button>
    </div>

    <div class="panel">
      <div class="panel-header">
        <h2>All Applications</h2>
        <div class="panel-actions">
          <button type="button" class="btn btn-sm btn-outline" onclick="resetDemo()">
            <i class="fa-solid fa-rotate-left"></i> Reset demo data
          </button>
        </div>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm [&_th]:whitespace-nowrap [&_th]:border-b [&_th]:border-[#90caf9] [&_th]:bg-[#e3f2fd] [&_th]:px-3.5 [&_th]:py-3 [&_th]:text-left [&_th]:font-heading [&_th]:text-[11px] [&_th]:font-semibold [&_th]:uppercase [&_th]:tracking-wider [&_th]:text-[#546e7e] [&_td]:border-b [&_td]:border-[#e3f2fd] [&_td]:px-3.5 [&_td]:py-3.5 [&_td]:align-middle [&_td]:text-[#0d47a1] [&_tr:last-child_td]:border-b-0 [&_tbody_tr:hover_td]:bg-[#e3f2fd]">
          <thead>
          <tr>
            <th>Applicant</th>
            <th>Internship</th>
            <th>Institute</th>
            <th>Applied</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody id="appsBody">
          <tr data-id="1041" data-kind="applications" data-status="pending">
            <td><strong>Anjali Thapa</strong></td>
            <td>Frontend Developer Intern</td>
            <td>Institute of Engineering</td>
            <td>Oct 06, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="approved" title="Approve" class="!border-emerald-500 !bg-emerald-500 !text-white hover:!border-emerald-600 hover:!bg-emerald-600"><i class="fa-solid fa-check"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="rejected" title="Reject" class="!border-red-500 !text-red-500 hover:!bg-red-50 hover:!text-red-600"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1040" data-kind="applications" data-status="approved">
            <td><strong>Bibek Shrestha</strong></td>
            <td>Backend Developer Intern</td>
            <td>Tribhuvan University</td>
            <td>Oct 05, 2026</td>
            <td><span class="status-approved">Approved</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="applications" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1039" data-kind="applications" data-status="pending">
            <td><strong>Priya Karki</strong></td>
            <td>Data Analyst Intern</td>
            <td>Kathmandu University</td>
            <td>Oct 04, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="approved" title="Approve" class="!border-emerald-500 !bg-emerald-500 !text-white hover:!border-emerald-600 hover:!bg-emerald-600"><i class="fa-solid fa-check"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="rejected" title="Reject" class="!border-red-500 !text-red-500 hover:!bg-red-50 hover:!text-red-600"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1038" data-kind="applications" data-status="rejected">
            <td><strong>Sandip Gurung</strong></td>
            <td>DevOps Engineering Intern</td>
            <td>Pokhara University</td>
            <td>Oct 03, 2026</td>
            <td><span class="status-rejected">Rejected</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="applications" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1037" data-kind="applications" data-status="waitlist">
            <td><strong>Nisha Rai</strong></td>
            <td>UI/UX Design Intern</td>
            <td>St. Xavier's College</td>
            <td>Oct 02, 2026</td>
            <td><span class="status-waitlist">Waitlist</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="applications" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1036" data-kind="applications" data-status="approved">
            <td><strong>Kabita Sharma</strong></td>
            <td>Frontend Developer Intern</td>
            <td>Islington College</td>
            <td>Oct 01, 2026</td>
            <td><span class="status-approved">Approved</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="applications" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1035" data-kind="applications" data-status="pending">
            <td><strong>Rojan Lama</strong></td>
            <td>Marketing &amp; Content Intern</td>
            <td>Ace Institute of Management</td>
            <td>Sep 30, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="approved" title="Approve" class="!border-emerald-500 !bg-emerald-500 !text-white hover:!border-emerald-600 hover:!bg-emerald-600"><i class="fa-solid fa-check"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="rejected" title="Reject" class="!border-red-500 !text-red-500 hover:!bg-red-50 hover:!text-red-600"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="1034" data-kind="applications" data-status="pending">
            <td><strong>Dipesh K.C.</strong></td>
            <td>Data Analyst Intern</td>
            <td>Tribhuvan University</td>
            <td>Sep 29, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="approved" title="Approve" class="!border-emerald-500 !bg-emerald-500 !text-white hover:!border-emerald-600 hover:!bg-emerald-600"><i class="fa-solid fa-check"></i></button>
                <button type="button" data-action="set-status" data-kind="applications" data-status="rejected" title="Reject" class="!border-red-500 !text-red-500 hover:!bg-red-50 hover:!text-red-600"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</div>

<!-- Custom yes/no modal (used by delete and status buttons) -->
<jsp:include page="organizer-modal.jsp"></jsp:include>


<!-- Small popup message (showToast in admin.js) -->
<div class="toast" id="toast">
  <i class="fa-solid fa-circle-check"></i>
  <p id="toastMsg">Saved successfully</p>
</div>

<script src="${cp}/assets/js/organizer.js"></script>
</body>

</html>