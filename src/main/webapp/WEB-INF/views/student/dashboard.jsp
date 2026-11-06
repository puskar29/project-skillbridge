<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 09/10/2026
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="studyYearLabel" value="${student.studyYear}"/>
<c:choose>
  <c:when test="${student.studyYear == '1'}"><c:set var="studyYearLabel" value="1st Year"/></c:when>
  <c:when test="${student.studyYear == '2'}"><c:set var="studyYearLabel" value="2nd Year"/></c:when>
  <c:when test="${student.studyYear == '3'}"><c:set var="studyYearLabel" value="3rd Year"/></c:when>
  <c:when test="${student.studyYear == '4'}"><c:set var="studyYearLabel" value="4th Year"/></c:when>
  <c:when test="${student.studyYear == '5+'}"><c:set var="studyYearLabel" value="5th Year+"/></c:when>
  <c:when test="${student.studyYear == 'GRADUATE'}"><c:set var="studyYearLabel" value="Graduate"/></c:when>
</c:choose>
<c:set var="genderLabel" value="${student.gender}"/>
<c:choose>
  <c:when test="${student.gender == 'MALE'}"><c:set var="genderLabel" value="Male"/></c:when>
  <c:when test="${student.gender == 'FEMALE'}"><c:set var="genderLabel" value="Female"/></c:when>
  <c:when test="${student.gender == 'OTHER'}"><c:set var="genderLabel" value="Other"/></c:when>
  <c:when test="${student.gender == 'PREFER_NOT_TO_SAY'}"><c:set var="genderLabel" value="Prefer not to say"/></c:when>
</c:choose>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | SkillBridge</title>
    <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png"/>

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600&display=swap"
          rel="stylesheet">

    <!-- font awsome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
          integrity="sha384-7WvIYI4vLdL28Kb0e0uLmaY+AFg62zUFE8P4OgFsKy0m93wWgDxFmdtVTkKNTJi8"
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- css -->
    <link rel="stylesheet" href="${cp}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${cp}/assets/css/organizer.css">

    <style>
        .simple-profile {
            width: 100% !important;
            max-width: 100% !important;
            margin: 0 !important;
            text-align: left !important;
        }

        .simple-profile-head {
            display: flex !important;
            align-items: center !important;
            justify-content: flex-start !important;
            gap: 24px !important;
            padding-bottom: 28px !important;
            border-bottom: 1px solid #e5e7eb !important;
        }

        .simple-profile-photo {
            flex: 0 0 auto !important;
            width: 104px !important;
            height: 104px !important;
            border-radius: 50% !important;
            object-fit: cover !important;
        }

        .simple-profile-identity {
            flex: 1 1 auto !important;
            min-width: 0 !important;
            text-align: left !important;
        }

        .simple-profile-identity h1 {
            font-family: "Poppins", sans-serif !important;
            font-size: 32px !important;
            font-weight: 700 !important;
            color: #111827 !important;
            line-height: 1.25 !important;
            margin: 0 0 6px 0 !important;
        }

        .simple-profile-role {
            font-size: 17px !important;
            color: #4b5563 !important;
            margin: 0 0 6px 0 !important;
        }

        .simple-profile-status {
            font-size: 15px !important;
            color: #6b7280 !important;
            margin: 0 !important;
        }

        .simple-profile-edit {
            margin-left: auto !important;
            flex: 0 0 auto !important;
            display: inline-flex !important;
            align-items: center !important;
            gap: 8px !important;
            padding: 10px 20px !important;
            border: 1px solid #d1d5db !important;
            border-radius: 8px !important;
            background: #ffffff !important;
            color: #111827 !important;
            font-family: "Inter", sans-serif !important;
            font-size: 15px !important;
            font-weight: 600 !important;
            text-decoration: none !important;
            transition: background 0.15s ease !important;
        }

        .simple-profile-edit:hover {
            background: #f3f4f6 !important;
        }

        .simple-section {
            padding: 28px 0 !important;
            border-bottom: 1px solid #e5e7eb !important;
            text-align: left !important;
        }

        .simple-section:last-child {
            border-bottom: 0 !important;
            padding-bottom: 0 !important;
        }

        .simple-section h2 {
            font-family: "Poppins", sans-serif !important;
            font-size: 22px !important;
            font-weight: 600 !important;
            color: #111827 !important;
            margin-bottom: 16px !important;
        }

        .simple-fields {
            display: flex !important;
            flex-direction: column !important;
            gap: 16px !important;
            margin: 0 !important;
        }

        .simple-field {
            display: flex !important;
            align-items: baseline !important;
            gap: 30px !important;
            font-size: 16.5px !important;
            line-height: 1.6 !important;
            margin: 0 !important;
        }

        .simple-field dt {
            flex: 0 0 240px !important;
            color: #6b7280 !important;
            font-weight: 500 !important;
            font-size: 16px !important;
        }

        .simple-field dd {
            margin: 0 !important;
            color: #111827 !important;
            font-weight: 500 !important;
            font-size: 16.5px !important;
            overflow-wrap: anywhere !important;
        }

        .skill-chip {
            display: inline-flex;
            align-items: center;
            padding: 6px 14px;
            border-radius: 9999px;
            font-size: 14.5px;
            font-weight: 500;
            background: #eff6ff;
            color: #1d4ed8;
            border: 1px solid #bfdbfe;
        }
    </style>
</head>

<body>
<c:if test="${param.applied != null or param.registered != null}">
    <div class="action-notification" role="status">
        <i class="fa-solid fa-circle-check"></i>
        <span>
            <c:choose>
                <c:when test="${param.applied != null}">Application submitted successfully.</c:when>
                <c:otherwise>Workshop registration completed successfully.</c:otherwise>
            </c:choose>
        </span>
    </div>
</c:if>
<jsp:include page="student-sidebar.jsp">
    <jsp:param name="activePage" value="overview"/>
</jsp:include>

<!-- MAIN CONTENT -->
<div class="main-area">

    <jsp:include page="student-topbar.jsp"></jsp:include>

    <div class="content">

        <!-- PAGE: OVERVIEW -->
        <div class="page active" id="page-overview">

            <section class="hero-banner">
                <div>
                    <span class="hero-tag">Your SkillBridge Space</span>
                    <h1>Welcome, ${empty student ? 'Student' : student.firstName}!</h1>
                    <p>Welcome back to your student dashboard. Here is what's happening with your applications and
                        workshops.</p>
                    <div class="hero-actions">
                        <a href="#" class="btn btn-primary btn-sm" onclick="openPage('browse'); return false;">
                            <i class="fa-solid fa-compass"></i> Browse Opportunities
                        </a>
                        <a href="${cp}/student/profile" class="btn btn-ghost btn-sm">
                            <i class="fa-solid fa-user"></i> My Profile
                        </a>
                    </div>
                </div>
            </section>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon blue"><i class="fa-solid fa-briefcase"></i></div>
                    <div class="stat-info">
                        <h3>${empty applications ? 0 : applications.size()}</h3>
                        <p>Applications Sent</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon green"><i class="fa-solid fa-clipboard-check"></i></div>
                    <div class="stat-info">
                        <h3>${empty registrations ? 0 : registrations.size()}</h3>
                        <p>Workshop Registrations</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon amber"><i class="fa-solid fa-graduation-cap"></i></div>
                    <div class="stat-info">
                        <h3>${empty student.college ? 'College' : student.college}</h3>
                        <p>College</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon red"><i class="fa-solid fa-calendar-days"></i></div>
                    <div class="stat-info">
                        <h3>${empty memberSince ? 'Active' : memberSince}</h3>
                        <p>Member Since</p>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2>Recent Applications</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="openPage('applications'); return false;">View
                            All
                        </button>
                    </div>
                </div>
                <div class="table-wrap">
                    <table>
                        <thead>
                        <tr>
                            <th>Internship</th>
                            <th>Company</th>
                            <th>Applied</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${applications}" var="application" varStatus="loop">
                            <c:if test="${loop.index < 3}">
                                <tr>
                                    <td><strong><c:out value="${application.internship.title}"/></strong></td>
                                    <td><c:out value="${application.internship.company}"/></td>
                                    <td><c:out value="${application.appliedAt}"/></td>
                                    <td><span class="status-${application.status.name().toLowerCase()}"><c:out value="${application.status}"/></span></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty applications}">
                            <tr><td colspan="4">You have not applied to any internships yet.</td></tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2>Recent Registrations</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="openPage('registrations'); return false;">View
                            All
                        </button>
                    </div>
                </div>
                <div class="table-wrap">
                    <table>
                        <thead>
                        <tr>
                            <th>Workshop</th>
                            <th>Organizer</th>
                            <th>Registered</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${registrations}" var="registration" varStatus="loop">
                            <c:if test="${loop.index < 3}">
                                <tr>
                                    <td><strong><c:out value="${registration.workshop.title}"/></strong></td>
                                    <td><c:out value="${registration.workshop.organizer}"/></td>
                                    <td><c:out value="${registration.registeredAt}"/></td>
                                    <td><span class="status-${registration.status.name().toLowerCase()}"><c:out value="${registration.status}"/></span></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty registrations}">
                            <tr><td colspan="4">You have not registered for any workshops yet.</td></tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- PAGE: BROWSE & APPLY -->
        <div class="page" id="page-browse">
            <div class="panel">
                <div class="panel-header">
                    <h2>Open Internships</h2>
                    <span class="badge badge-internship">${empty internships ? 0 : internships.size()} Available</span>
                </div>
                <div class="browse-grid">
                    <c:forEach items="${internships}" var="intern">
                        <div class="browse-card">
                            <div class="browse-top">
                                <span class="badge badge-internship">Internship</span>
                                <span class="browse-loc"><i class="fa-solid fa-location-dot"></i> <c:out value="${intern.location}"/></span>
                            </div>
                            <h3 class="browse-title"><c:out value="${intern.title}"/></h3>
                            <p class="browse-sub"><c:out value="${intern.company}"/></p>
                            <div class="browse-meta">
                                <span><i class="fa-solid fa-briefcase"></i> <c:out value="${intern.type != null ? intern.type.displayName : 'Internship'}"/></span>
                                <span><i class="fa-regular fa-clock"></i> <c:out value="${intern.duration}"/></span>
                            </div>
                            <div class="browse-footer">
                                <span class="browse-deadline"><i class="fa-regular fa-calendar"></i> Deadline <c:out value="${intern.deadline}"/></span>
                                <form method="post" action="${cp}/student/internships/${intern.id}/apply">
                                    <button type="submit" class="btn btn-primary btn-sm"><i class="fa-solid fa-paper-plane"></i> Apply</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty internships}"><p>No internships are available right now.</p></c:if>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2>Open Workshops</h2>
                    <span class="badge badge-workshop">${empty workshops ? 0 : workshops.size()} Available</span>
                </div>
                <div class="browse-grid">
                    <c:forEach items="${workshops}" var="workshop">
                        <div class="browse-card">
                            <div class="browse-top">
                                <span class="badge badge-workshop">Workshop</span>
                                <span class="browse-loc"><i class="fa-solid fa-location-dot"></i> <c:out value="${workshop.location}"/></span>
                            </div>
                            <h3 class="browse-title"><c:out value="${workshop.title}"/></h3>
                            <p class="browse-sub"><c:out value="${workshop.organizer}"/></p>
                            <div class="browse-meta">
                                <span><i class="fa-regular fa-clock"></i> <c:out value="${workshop.duration}"/></span>
                                <span><i class="fa-solid fa-graduation-cap"></i> <c:out value="${workshop.level != null ? workshop.level.displayName : 'All Levels'}"/></span>
                            </div>
                            <div class="browse-footer">
                                <span class="browse-deadline"><i class="fa-regular fa-calendar"></i> Deadline <c:out value="${workshop.deadline}"/></span>
                                <form method="post" action="${cp}/student/workshops/${workshop.id}/register">
                                    <button type="submit" class="btn btn-primary btn-sm"><i class="fa-solid fa-paper-plane"></i> Register</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty workshops}"><p>No workshops are available right now.</p></c:if>
                </div>
            </div>

        </div>

<%--        <!-- PAGE: MY APPLICATIONS -->--%>
        <div class="page" id="page-applications">
            <div class="panel">
                <div class="panel-header">
                    <h2>My Applications</h2>
                </div>
                <div class="table-wrap">
                    <table>
                        <thead>
                        <tr>
                            <th>Internship</th>
                            <th>Company</th>
                            <th>Applied</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${applications}" var="application">
                            <tr>
                                <td><c:out value="${application.internship.title}"/></td>
                                <td><c:out value="${application.internship.company}"/></td>
                                <td><c:out value="${application.appliedAt}"/></td>
                                <td>
            <span class="status-${application.status.name().toLowerCase()}">
                <c:out value="${application.status}"/>
            </span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- PAGE: MY REGISTRATIONS -->
        <div class="page" id="page-registrations">
            <div class="panel">
                <div class="panel-header">
                    <h2>My Registrations</h2>
                </div>
                <div class="table-wrap">
                    <table>
                        <thead>
                        <tr>
                            <th>Workshop</th>
                            <th>Organizer</th>
                            <th>Registered</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${registrations}" var="registration">
                            <tr>
                                <td><c:out value="${registration.workshop.title}"/></td>
                                <td><c:out value="${registration.workshop.organizer}"/></td>
                                <td><c:out value="${registration.registeredAt}"/></td>
                                <td>
            <span class="status-${registration.status.name().toLowerCase()}">
                <c:out value="${registration.status}"/>
            </span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- PAGE: MY PROFILE -->
        <div class="page" id="page-profile">
            <div class="simple-profile">

                <header class="simple-profile-head">
                    <c:choose>
                        <c:when test="${not empty student.profileImage}">
                            <img src="${cp}/uploads/profile/${student.profileImage}"
                                 alt="Student profile picture"
                                 class="simple-profile-photo">
                        </c:when>
                        <c:otherwise>
                            <img src="${cp}/assets/images/pfp.png"
                                 alt="Default profile picture"
                                 class="simple-profile-photo">
                        </c:otherwise>
                    </c:choose>

                    <div class="simple-profile-identity">
                        <h1>${student.firstName} ${student.lastName}</h1>
                        <p class="simple-profile-role">${empty student.major ? 'Student' : student.major}<c:if test="${not empty studyYearLabel}"> &bull; ${studyYearLabel}</c:if></p>
                        <p class="simple-profile-status">
                            Active Student
                            <c:if test="${not empty memberSince}">
                                &middot; Member since ${memberSince}
                            </c:if>
                        </p>
                    </div>

                    <a href="${cp}/student/profile/edit" class="simple-profile-edit">
                        <i class="fa-solid fa-pen"></i> Edit Profile
                    </a>
                </header>

                <section class="simple-section">
                    <h2>Academic Details</h2>
                    <dl class="simple-fields">
                        <div class="simple-field">
                            <dt>College / University</dt>
                            <dd>${empty student.college ? '—' : student.college}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Course / Major</dt>
                            <dd>${empty student.major ? '—' : student.major}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Year of Study</dt>
                            <dd>${empty studyYearLabel ? '—' : studyYearLabel}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Graduation Year</dt>
                            <dd>${empty student.graduationYear ? '—' : student.graduationYear}</dd>
                        </div>
                    </dl>
                </section>

                <section class="simple-section">
                    <h2>Personal Details</h2>
                    <dl class="simple-fields">
                        <div class="simple-field">
                            <dt>Full Name</dt>
                            <dd>${student.firstName} ${student.lastName}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Date of Birth</dt>
                            <dd>${empty student.dateOfBirth ? '—' : student.dateOfBirth}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Gender</dt>
                            <dd>${empty genderLabel ? '—' : genderLabel}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Account Status</dt>
                            <dd>Active Student</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Member Since</dt>
                            <dd>${empty memberSince ? '—' : memberSince}</dd>
                        </div>
                    </dl>
                </section>

                <section class="simple-section">
                    <h2>Contact Information</h2>
                    <dl class="simple-fields">
                        <div class="simple-field">
                            <dt>Email</dt>
                            <dd>${student.email}</dd>
                        </div>

                        <div class="simple-field">
                            <dt>Phone</dt>
                            <dd>${empty student.phone ? '—' : student.phone}</dd>
                        </div>
                    </dl>
                </section>

                <section class="simple-section">
                    <h2>Skills</h2>
                    <c:choose>
                        <c:when test="${not empty student.skills}">
                            <div style="display: flex; flex-wrap: wrap; gap: 8px; margin-top: 4px;">
                                <c:forEach var="sk" items="${student.skills}">
                                    <span class="skill-chip"><c:out value="${sk}"/></span>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p style="color: #6b7280;">No skills added yet.</p>
                        </c:otherwise>
                    </c:choose>
                </section>

            </div>
        </div>



    </div>
</div>

<script>
    // Switch page

    function openPage(pageName) {
        // Hide all pages
        const pages = document.querySelectorAll(".page");

        pages.forEach((page) => {
            page.classList.remove("active");
        });

        // Show selected page
        const page = document.getElementById("page-" + pageName);

        if (page) {
            page.classList.add("active");
        }

        // Remove active from all navigation items
        const navItems = document.querySelectorAll(".nav-item");

        navItems.forEach((item) => {
            item.classList.remove("active");
        });

        // Add active to selected navigation item
        const navItem = document.querySelector('.nav-item[data-page="' + pageName + '"]');

        if (navItem) {
            navItem.classList.add("active");
        }

        // Close sidebar
        closeSidebar();

        // Change page title
        const pageTitle = document.getElementById("pageTitle");
        const pageSubtitle = document.getElementById("pageSubtitle");

        if (pageName === "overview") {
            pageTitle.textContent = "Overview";
            pageSubtitle.textContent = "A quick look at your activity";
        } else if (pageName === "browse") {
            pageTitle.textContent = "Browse & Apply";
            pageSubtitle.textContent = "Open internships and workshops";
        } else if (pageName === "applications") {
            pageTitle.textContent = "My Applications";
            pageSubtitle.textContent = "Internships you have applied for";
        } else if (pageName === "registrations") {
            pageTitle.textContent = "My Registrations";
            pageSubtitle.textContent = "Workshops you registered for";
        } else if (pageName === "profile") {
            pageTitle.textContent = "My Profile";
            pageSubtitle.textContent = "Your account details";
        }
    }

    // Open side menu

    function openSidebar() {
        document.getElementById("sidebar").classList.add("open");

        document.getElementById("sidebarOverlay").classList.add("show");
    }

    // Close side menu
    function closeSidebar() {
        document.getElementById("sidebar").classList.remove("open");

        document.getElementById("sidebarOverlay").classList.remove("show");
    }

    // Edit profile

    function editSection(section) {
        // Hide normal content
        document.getElementById(section + "-list").style.display = "none";

        // Show edit area
        document.getElementById(section + "-edit").style.display = "block";

        // Skills

        if (section === "skills") {
            const skillTags = document.querySelectorAll("#skills-list .skill-tag");

            let skills = [];

            skillTags.forEach((tag) => {
                skills.push(tag.textContent);
            });

            document.getElementById("skills-input").value = skills.join(", ");
        }

        // Interests
        else if (section === "interests") {
            const interestTags = document.querySelectorAll("#interests-list .skill-tag");

            let interests = [];

            interestTags.forEach((tag) => {
                interests.push(tag.textContent);
            });

            document.getElementById("interests-input").value = interests.join(", ");
        }

        // Languages
        else if (section === "languages") {
            const languageItems = document.querySelectorAll("#languages-list .language-item");

            let languages = [];

            languageItems.forEach((item) => {
                const name = item.querySelector("strong").textContent;

                const level = item.querySelector("span").textContent;

                languages.push(name + ": " + level);
            });

            document.getElementById("languages-input").value = languages.join("\n");
        }
    }

    // Cancel edit

    function cancelEdit(section) {
        const list = document.getElementById(section + "-list");

        const edit = document.getElementById(section + "-edit");

        // Show original content
        list.style.display = "flex";

        // Skills and interests use row layout
        if (section === "skills" || section === "interests") {
            list.style.flexWrap = "wrap";
            list.style.gap = "10px";
        }

        // Other sections use column layout
        else {
            list.style.flexDirection = "column";
            list.style.gap = "16px";
        }

        // Hide edit form
        edit.style.display = "none";
    }

    // Save skills

    function saveSkills() {
        const input = document.getElementById("skills-input").value;

        const skillsList = document.getElementById("skills-list");

        // Remove old skills
        skillsList.innerHTML = "";

        if (input.trim() !== "") {
            // Separate skills using comma
            const skills = input.split(",");

            skills.forEach((skill) => {
                const cleanSkill = skill.trim();

                if (cleanSkill !== "") {
                    const span = document.createElement("span");

                    span.className = "skill-tag";

                    span.textContent = cleanSkill;

                    skillsList.appendChild(span);
                }
            });
        }

        // Show skills
        skillsList.style.display = "flex";
        skillsList.style.flexWrap = "wrap";
        skillsList.style.gap = "10px";

        // Hide edit form
        document.getElementById("skills-edit").style.display = "none";
    }

    // Save interests

    function saveInterests() {
        const input = document.getElementById("interests-input").value;

        const interestsList = document.getElementById("interests-list");

        // Remove old interests
        interestsList.innerHTML = "";

        if (input.trim() !== "") {
            const interests = input.split(",");

            interests.forEach((interest) => {
                const cleanInterest = interest.trim();

                if (cleanInterest !== "") {
                    const span = document.createElement("span");

                    span.className = "skill-tag";

                    span.textContent = cleanInterest;

                    interestsList.appendChild(span);
                }
            });
        }

        interestsList.style.display = "flex";
        interestsList.style.flexWrap = "wrap";
        interestsList.style.gap = "10px";

        document.getElementById("interests-edit").style.display = "none";
    }

    // Save languages

    function saveLanguages() {
        const input = document.getElementById("languages-input").value;

        const languagesList = document.getElementById("languages-list");

        // Remove old languages
        languagesList.innerHTML = "";

        if (input.trim() !== "") {
            // Each language should be on a new line
            const languages = input.split("\n");

            languages.forEach((language) => {
                const cleanLanguage = language.trim();

                // Example: Java: Intermediate

                if (cleanLanguage !== "" && cleanLanguage.includes(":")) {
                    const parts = cleanLanguage.split(":");

                    const name = parts[0].trim();

                    const level = parts[1].trim();

                    const div = document.createElement("div");

                    div.className = "language-item";

                    const strong = document.createElement("strong");

                    strong.textContent = name;

                    const span = document.createElement("span");

                    span.textContent = level;

                    div.appendChild(strong);

                    div.appendChild(span);

                    languagesList.appendChild(div);
                }
            });
        }

        languagesList.style.display = "flex";
        languagesList.style.flexDirection = "column";
        languagesList.style.gap = "12px";

        document.getElementById("languages-edit").style.display = "none";
    }

    // Save education

    function saveEducation() {
        const input = document.getElementById("education-input").value;

        const educationList = document.getElementById("education-list");

        educationList.innerHTML = "";

        if (input.trim() !== "") {
            // Separate each education using empty line
            const educations = input.split("\n\n");

            educations.forEach((education) => {
                const cleanEducation = education.trim();

                if (cleanEducation !== "") {
                    const div = document.createElement("div");

                    div.className = "profile-item";

                    const icon = document.createElement("div");

                    icon.className = "profile-item-icon";

                    icon.innerHTML = '<i class="fa-solid fa-graduation-cap"></i>';

                    const content = document.createElement("div");

                    content.className = "profile-item-content";

                    const paragraph = document.createElement("p");

                    paragraph.innerHTML = cleanEducation.replace(/\n/g, "<br>");

                    content.appendChild(paragraph);

                    div.appendChild(icon);

                    div.appendChild(content);

                    educationList.appendChild(div);
                }
            });
        }

        educationList.style.display = "flex";
        educationList.style.flexDirection = "column";
        educationList.style.gap = "16px";

        document.getElementById("education-edit").style.display = "none";
    }

    // Save projects

    function saveProjects() {
        const input = document.getElementById("projects-input").value;

        const projectsList = document.getElementById("projects-list");

        projectsList.innerHTML = "";

        if (input.trim() !== "") {
            const projects = input.split("\n\n");

            projects.forEach((project) => {
                const cleanProject = project.trim();

                if (cleanProject !== "") {
                    const div = document.createElement("div");

                    div.className = "profile-item";

                    const icon = document.createElement("div");

                    icon.className = "profile-item-icon";

                    icon.innerHTML = '<i class="fa-solid fa-code"></i>';

                    const content = document.createElement("div");

                    content.className = "profile-item-content";

                    const paragraph = document.createElement("p");

                    paragraph.innerHTML = cleanProject.replace(/\n/g, "<br>");

                    content.appendChild(paragraph);

                    div.appendChild(icon);

                    div.appendChild(content);

                    projectsList.appendChild(div);
                }
            });
        }

        projectsList.style.display = "flex";
        projectsList.style.flexDirection = "column";
        projectsList.style.gap = "16px";

        document.getElementById("projects-edit").style.display = "none";
    }

    // Save certifications

    function saveCertifications() {
        const input = document.getElementById("certifications-input").value;

        const certificationsList = document.getElementById("certifications-list");

        certificationsList.innerHTML = "";

        if (input.trim() !== "") {
            const certifications = input.split("\n\n");

            certifications.forEach((certification) => {
                const cleanCertification = certification.trim();

                if (cleanCertification !== "") {
                    const div = document.createElement("div");

                    div.className = "profile-item";

                    const icon = document.createElement("div");

                    icon.className = "profile-item-icon";

                    icon.innerHTML = '<i class="fa-solid fa-certificate"></i>';

                    const content = document.createElement("div");

                    content.className = "profile-item-content";

                    const paragraph = document.createElement("p");

                    paragraph.innerHTML = cleanCertification.replace(/\n/g, "<br>");

                    content.appendChild(paragraph);

                    div.appendChild(icon);

                    div.appendChild(content);

                    certificationsList.appendChild(div);
                }
            });
        }

        certificationsList.style.display = "flex";
        certificationsList.style.flexDirection = "column";
        certificationsList.style.gap = "16px";

        document.getElementById("certifications-edit").style.display = "none";
    }

    // Save links

    function saveLinks() {
        const input = document.getElementById("links-input").value;

        const linksList = document.getElementById("links-list");

        linksList.innerHTML = "";

        if (input.trim() !== "") {
            // Each link should be on a new line
            const links = input.split("\n");

            links.forEach((link) => {
                const cleanLink = link.trim();

                if (cleanLink !== "" && cleanLink.includes(":")) {
                    const parts = cleanLink.split(":");

                    const name = parts[0].trim();

                    const url = parts.slice(1).join(":").trim();

                    const a = document.createElement("a");

                    a.className = "social-link";

                    a.href = url;

                    a.target = "_blank";

                    a.rel = "noopener noreferrer";

                    // Default icon
                    let icon = "fa-solid fa-link";

                    const lowerName = name.toLowerCase();

                    if (lowerName.includes("github")) {
                        icon = "fa-brands fa-github";
                    } else if (lowerName.includes("linkedin")) {
                        icon = "fa-brands fa-linkedin";
                    } else if (lowerName.includes("behance")) {
                        icon = "fa-brands fa-behance";
                    } else if (lowerName.includes("portfolio") || lowerName.includes("website")) {
                        icon = "fa-solid fa-globe";
                    } else if (lowerName.includes("twitter") || lowerName.includes("x")) {
                        icon = "fa-brands fa-x-twitter";
                    } else if (lowerName.includes("instagram")) {
                        icon = "fa-brands fa-instagram";
                    } else if (lowerName.includes("facebook")) {
                        icon = "fa-brands fa-facebook";
                    }

                    a.innerHTML = '<i class="' + icon + '"></i> ' + name;

                    linksList.appendChild(a);
                }
            });
        }

        linksList.style.display = "flex";
        linksList.style.flexWrap = "wrap";
        linksList.style.gap = "10px";

        document.getElementById("links-edit").style.display = "none";
    }

    // Edit hero

    function editHero() {
        const name = document.querySelector(".profile-hero-info h1").textContent;

        const title = document.getElementById("hero-title").textContent;

        const bio = document.getElementById("hero-bio").textContent.trim();

        document.getElementById("hero-name-input").value = name;

        document.getElementById("hero-title-input").value = title;

        document.getElementById("hero-bio-input").value = bio;

        document.getElementById("hero-edit").style.display = "block";
    }

    // Cancel hero edit

    function cancelHero() {
        document.getElementById("hero-edit").style.display = "none";
    }

    // Save hero

    function saveHero() {
        const name = document.getElementById("hero-name-input").value;

        const title = document.getElementById("hero-title-input").value;

        const bio = document.getElementById("hero-bio-input").value;

        document.querySelector(".profile-hero-info h1").textContent = name;

        document.getElementById("hero-title").textContent = title;

        document.getElementById("hero-bio").textContent = bio;

        document.getElementById("hero-edit").style.display = "none";
    }

    // Edit personal information

    function togglePersonalEdit() {
        const infoDiv = document.getElementById("personal-info");

        const editDiv = document.getElementById("personal-edit");

        // If edit form is hidden
        if (editDiv.style.display === "none" || editDiv.style.display === "") {
            // Put current information into inputs

            document.getElementById("email-input").value =
                document.getElementById("email-display").textContent;

            document.getElementById("phone-input").value =
                document.getElementById("phone-display").textContent;

            document.getElementById("institution-input").value =
                document.getElementById("institution-display").textContent;

            document.getElementById("major-input").value =
                document.getElementById("major-display").textContent;

            document.getElementById("gradyear-input").value =
                document.getElementById("gradyear-display").textContent;

            document.getElementById("cgpa-input").value =
                document.getElementById("cgpa-display").textContent;

            document.getElementById("location-input").value =
                document.getElementById("location-display").textContent;

            // Hide normal information
            infoDiv.style.display = "none";

            // Show edit form
            editDiv.style.display = "block";
        } else {
            // Show normal information
            infoDiv.style.display = "flex";

            // Hide edit form
            editDiv.style.display = "none";
        }
    }

    // Save personal information

    function savePersonalInfo() {
        const email = document.getElementById("email-input").value;

        const phone = document.getElementById("phone-input").value;

        const institution = document.getElementById("institution-input").value;

        const major = document.getElementById("major-input").value;

        const gradYear = document.getElementById("gradyear-input").value;

        const cgpa = document.getElementById("cgpa-input").value;

        const location = document.getElementById("location-input").value;

        // Update displayed information

        document.getElementById("email-display").textContent = email;

        document.getElementById("phone-display").textContent = phone;

        document.getElementById("institution-display").textContent = institution;

        document.getElementById("major-display").textContent = major;

        document.getElementById("gradyear-display").textContent = gradYear;

        document.getElementById("cgpa-display").textContent = cgpa;

        document.getElementById("location-display").textContent = location;

        // Update hero location

        document.getElementById("hero-location").textContent = location;

        // Update hero degree

        document.getElementById("hero-degree").textContent = "Year 3, " + major;

        // Show normal information

        document.getElementById("personal-info").style.display = "flex";

        // Hide edit form

        document.getElementById("personal-edit").style.display = "none";
    }

    // Cancel personal edit

    function cancelPersonalEdit() {
        document.getElementById("personal-info").style.display = "flex";

        document.getElementById("personal-edit").style.display = "none";
    }
</script>
</body>

</html>
