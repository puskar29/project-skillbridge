<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 6:46 PM
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
  <title>Dashboard | Organizer | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
        integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- tailwind css — every table below is styled with utilities from here -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="${cp}/assets/js/tailwind.config.js"></script>

  <!-- css — everything except the tables -->
  <link rel="stylesheet" href="${cp}/assets/css/organizer.css">
</head>

<body>
<!-- Demo data — hardcoded, localStorage keeps your edits -->

<!-- Dark background that appears behind the menu on small screens -->
<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<!-- SIDEBAR (menu on the left) -->
<jsp:include page="organizer-sidebar.jsp">
  <jsp:param name="activePage" value="dashboard"/>
</jsp:include>


<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <header class="topbar">
    <div class="topbar-title">
      <h1>Dashboard</h1>
      <p>Overview of platform activity</p>
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

    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-icon blue"><i class="fa-solid fa-briefcase"></i></div>
        <div class="stat-info">
          <h3>14</h3>
          <p>Active Internships</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon amber"><i class="fa-solid fa-chalkboard-user"></i></div>
        <div class="stat-info">
          <h3>9</h3>
          <p>Active Workshops</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon green"><i class="fa-solid fa-file-lines"></i></div>
        <div class="stat-info">
          <h3>246</h3>
          <p>Total Applications</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon red"><i class="fa-solid fa-clock"></i></div>
        <div class="stat-info">
          <h3>18</h3>
          <p>Pending Reviews</p>
        </div>
      </div>
    </div>

    <!-- Recent internship applications -->
    <div class="panel">
      <div class="panel-header">
        <h2>Recent Applications</h2>
        <div class="panel-actions">
          <a href="${cp}/applications" class="btn btn-sm btn-outline">View All</a>
        </div>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm [&_th]:whitespace-nowrap [&_th]:border-b [&_th]:border-[#90caf9] [&_th]:bg-[#e3f2fd] [&_th]:px-3.5 [&_th]:py-3 [&_th]:text-left [&_th]:font-heading [&_th]:text-[11px] [&_th]:font-semibold [&_th]:uppercase [&_th]:tracking-wider [&_th]:text-[#546e7e] [&_td]:border-b [&_td]:border-[#e3f2fd] [&_td]:px-3.5 [&_td]:py-3.5 [&_td]:align-middle [&_td]:text-[#0d47a1] [&_tr:last-child_td]:border-b-0 [&_tbody_tr:hover_td]:bg-[#e3f2fd]">
          <thead>
          <tr>
            <th>Applicant</th>
            <th>Opportunity</th>
            <th>Type</th>
            <th>Applied</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <tr data-id="1041" data-kind="applications" data-status="pending">
            <td><strong>Anjali Thapa</strong></td>
            <td>Frontend Developer Intern</td>
            <td><span class="badge badge-internship">Internship</span></td>
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
            <td><span class="badge badge-internship">Internship</span></td>
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
            <td><span class="badge badge-internship">Internship</span></td>
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
            <td><span class="badge badge-internship">Internship</span></td>
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
            <td><span class="badge badge-internship">Internship</span></td>
            <td>Oct 02, 2026</td>
            <td><span class="status-waitlist">Waitlist</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="applications" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Recent workshop registrations -->
    <div class="panel">
      <div class="panel-header">
        <h2>Recent Registrations</h2>
        <div class="panel-actions">
          <a href="${cp}/registrations" class="btn btn-sm btn-outline">View All</a>
        </div>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm [&_th]:whitespace-nowrap [&_th]:border-b [&_th]:border-[#90caf9] [&_th]:bg-[#e3f2fd] [&_th]:px-3.5 [&_th]:py-3 [&_th]:text-left [&_th]:font-heading [&_th]:text-[11px] [&_th]:font-semibold [&_th]:uppercase [&_th]:tracking-wider [&_th]:text-[#546e7e] [&_td]:border-b [&_td]:border-[#e3f2fd] [&_td]:px-3.5 [&_td]:py-3.5 [&_td]:align-middle [&_td]:text-[#0d47a1] [&_tr:last-child_td]:border-b-0 [&_tbody_tr:hover_td]:bg-[#e3f2fd]">
          <thead>
          <tr>
            <th>Student</th>
            <th>Workshop</th>
            <th>Registered</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <tr data-id="2077" data-kind="registrations" data-status="confirmed">
            <td><strong>Anil Mehta</strong></td>
            <td>Web Development Bootcamp</td>
            <td>Oct 06, 2026</td>
            <td><span class="status-confirmed">Confirmed</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="registrations" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="2076" data-kind="registrations" data-status="pending">
            <td><strong>Sujata Adhikari</strong></td>
            <td>Data Science with Python</td>
            <td>Oct 05, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="set-status" data-kind="registrations" data-status="confirmed" title="Confirm" class="!border-emerald-500 !bg-emerald-500 !text-white hover:!border-emerald-600 hover:!bg-emerald-600"><i class="fa-solid fa-check"></i></button>
                <button type="button" data-action="set-status" data-kind="registrations" data-status="cancelled" title="Cancel" class="!border-red-500 !text-red-500 hover:!bg-red-50 hover:!text-red-600"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="2075" data-kind="registrations" data-status="confirmed">
            <td><strong>Rojan Lama</strong></td>
            <td>UI/UX Design Crash Course</td>
            <td>Oct 04, 2026</td>
            <td><span class="status-confirmed">Confirmed</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="registrations" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="2074" data-kind="registrations" data-status="cancelled">
            <td><strong>Kabita Sharma</strong></td>
            <td>Git &amp; GitHub Essentials</td>
            <td>Oct 03, 2026</td>
            <td><span class="status-cancelled">Cancelled</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="registrations" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="2073" data-kind="registrations" data-status="pending">
            <td><strong>Dipesh K.C.</strong></td>
            <td>Advanced React Patterns</td>
            <td>Oct 02, 2026</td>
            <td><span class="status-pending">Pending</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="set-status" data-kind="registrations" data-status="confirmed" title="Confirm" class="!border-emerald-500 !bg-emerald-500 !text-white hover:!border-emerald-600 hover:!bg-emerald-600"><i class="fa-solid fa-check"></i></button>
                <button type="button" data-action="set-status" data-kind="registrations" data-status="cancelled" title="Cancel" class="!border-red-500 !text-red-500 hover:!bg-red-50 hover:!text-red-600"><i class="fa-solid fa-xmark"></i></button>
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
