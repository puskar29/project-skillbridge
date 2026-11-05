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
  <title>Registrations | Admin | SkillBridge</title>
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
  <link rel="stylesheet" href="${cp}/assets/css/admin.css">
</head>

<body>
<!-- Demo data — hardcoded, localStorage keeps your edits -->

<jsp:include page="admin-sidebar.jsp">
  <jsp:param name="activePage" value="registrations"/>
</jsp:include>

<!-- MAIN CONTENT (right side) -->
<div class="main-area">

  <jsp:include page="admin-topbar.jsp">
    <jsp:param name="pageTitle" value="Registrations"/>
    <jsp:param name="pageSubtitle" value="Review and confirm workshop registrations"/>
</jsp:include>

  <div class="content">

    <div class="type-tabs" role="tablist">
      <button type="button" class="type-tab active" data-filter="all" onclick="filterStatus(this, 'regsBody')">All</button>
      <button type="button" class="type-tab" data-filter="pending" onclick="filterStatus(this, 'regsBody')">Pending</button>
      <button type="button" class="type-tab" data-filter="confirmed" onclick="filterStatus(this, 'regsBody')">Confirmed</button>
      <button type="button" class="type-tab" data-filter="cancelled" onclick="filterStatus(this, 'regsBody')">Cancelled</button>
    </div>

    <div class="panel">
      <div class="panel-header">
        <h2>All Registrations</h2>
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
            <th>Student</th>
            <th>Workshop</th>
            <th>Registered</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody id="regsBody">
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
          <tr data-id="2072" data-kind="registrations" data-status="confirmed">
            <td><strong>Nisha Rai</strong></td>
            <td>Web Development Bootcamp</td>
            <td>Oct 01, 2026</td>
            <td><span class="status-confirmed">Confirmed</span></td>
            <td>
              <div class="flex items-center gap-1.5 whitespace-nowrap [&>button]:grid [&>button]:h-8 [&>button]:w-8 [&>button]:cursor-pointer [&>button]:place-items-center [&>button]:rounded-lg [&>button]:border [&>button]:border-[#90caf9] [&>button]:bg-white [&>button]:text-[13px] [&>button]:text-[#546e7e] [&>button]:transition [&>button]:hover:border-brand [&>button]:hover:bg-brand-tint [&>button]:hover:text-brand">
                <button type="button" data-action="view" title="View"><i class="fa-solid fa-eye"></i></button>
                <button type="button" data-action="prompt-status" data-kind="registrations" title="Edit Status"><i class="fa-solid fa-pen"></i></button>
              </div>
            </td>
          </tr>
          <tr data-id="2071" data-kind="registrations" data-status="pending">
            <td><strong>Sandip Gurung</strong></td>
            <td>Data Science with Python</td>
            <td>Sep 30, 2026</td>
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

<jsp:include page="admin-modal.jsp"></jsp:include>

<script src="${cp}/assets/js/admin.js"></script>
</body>

</html>