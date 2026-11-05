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
</head>

<body>
<!-- Demo data — hardcoded static page, fill from your endpoint when dynamic -->
<jsp:include page="student-sidebar.jsp">
    <jsp:param name="activePage" value="overview"/>
</jsp:include>

<!-- MAIN CONTENT -->
<div class="main-area">

    <jsp:include page="student-topbar.jsp"></jsp:include>
`
    <div class="content">

        <!-- PAGE: OVERVIEW -->
        <div class="page active" id="page-overview">

            <section class="hero-banner">
                <div>
                    <span class="hero-tag">Your SkillBridge Space</span>
                    <h1>Hey, Asha!</h1>
                    <p>Welcome back to your student dashboard. Here is what's happening with your applications and
                        workshops.</p>
                    <div class="hero-actions">
                        <a href="#" class="btn btn-primary btn-sm" onclick="openPage('browse'); return false;">
                            <i class="fa-solid fa-compass"></i> Browse Opportunities
                        </a>
                        <a href="#" class="btn btn-ghost btn-sm" onclick="openPage('profile'); return false;">
                            <i class="fa-solid fa-user"></i> My Profile
                        </a>
                    </div>
                </div>
            </section>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon blue"><i class="fa-solid fa-briefcase"></i></div>
                    <div class="stat-info">
                        <h3>3</h3>
                        <p>Applications Sent</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon green"><i class="fa-solid fa-clipboard-check"></i></div>
                    <div class="stat-info">
                        <h3>2</h3>
                        <p>Workshop Registrations</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon amber"><i class="fa-solid fa-graduation-cap"></i></div>
                    <div class="stat-info">
                        <h3>Kathmandu University</h3>
                        <p>College</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon red"><i class="fa-solid fa-calendar-days"></i></div>
                    <div class="stat-info">
                        <h3>Oct 2026</h3>
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
                        <tr>
                            <td><strong>Frontend Developer Intern</strong></td>
                            <td>Himalayan Labs</td>
                            <td>Oct 04, 2026</td>
                            <td><span class="status-pending">Pending</span></td>
                        </tr>
                        <tr>
                            <td><strong>Data Analyst Intern</strong></td>
                            <td>Everest Analytics</td>
                            <td>Sep 27, 2026</td>
                            <td><span class="status-accepted">Accepted</span></td>
                        </tr>
                        <tr>
                            <td><strong>UI/UX Design Intern</strong></td>
                            <td>Craft Nepal</td>
                            <td>Sep 15, 2026</td>
                            <td><span class="status-pending">Pending</span></td>
                        </tr>
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
                        <tr>
                            <td><strong>Web Development Bootcamp</strong></td>
                            <td>Himalayan Labs</td>
                            <td>Oct 01, 2026</td>
                            <td><span class="status-confirmed">Confirmed</span></td>
                        </tr>
                        <tr>
                            <td><strong>Data Science with Python</strong></td>
                            <td>Everest Analytics</td>
                            <td>Sep 20, 2026</td>
                            <td><span class="status-confirmed">Confirmed</span></td>
                        </tr>
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
                    <div class="panel-actions">
                        <span class="badge badge-internship">3 Available</span>
                    </div>
                </div>
                <div class="browse-grid">

                    <!-- already applied — the POST form is gone in the static version -->
                    <div class="browse-card">
                        <div class="browse-top">
                            <span class="badge badge-internship">Internship</span>
                            <span class="browse-loc"><i class="fa-solid fa-location-dot"></i> Kathmandu</span>
                        </div>
                        <h3 class="browse-title">Frontend Developer Intern</h3>
                        <p class="browse-sub">Himalayan Labs</p>
                        <div class="browse-meta">
                            <span><i class="fa-solid fa-briefcase"></i> Full Time</span>
                            <span><i class="fa-regular fa-clock"></i> 3 months</span>
                            <span><i class="fa-solid fa-coins"></i> NPR 25,000 / month</span>
                        </div>
                        <div class="browse-footer">
                            <span class="browse-deadline"><i
                                    class="fa-regular fa-calendar"></i> Deadline Nov 30, 2026</span>
                            <span class="badge badge-applied"><i class="fa-solid fa-check"></i> Applied</span>
                        </div>
                    </div>

                    <div class="browse-card">
                        <div class="browse-top">
                            <span class="badge badge-internship">Internship</span>
                            <span class="browse-loc"><i class="fa-solid fa-location-dot"></i> Remote</span>
                        </div>
                        <h3 class="browse-title">Backend Developer Intern</h3>
                        <p class="browse-sub">Sagarmatha Soft</p>
                        <div class="browse-meta">
                            <span><i class="fa-solid fa-briefcase"></i> Full Time</span>
                            <span><i class="fa-regular fa-clock"></i> 6 months</span>
                            <span><i class="fa-solid fa-coins"></i> NPR 35,000 / month</span>
                        </div>
                        <div class="browse-footer">
                            <span class="browse-deadline"><i
                                    class="fa-regular fa-calendar"></i> Deadline Dec 15, 2026</span>
                            <button class="btn btn-primary btn-sm"><i class="fa-solid fa-paper-plane"></i> Apply
                            </button>
                        </div>
                    </div>

                    <div class="browse-card">
                        <div class="browse-top">
                            <span class="badge badge-internship">Internship</span>
                            <span class="browse-loc"><i class="fa-solid fa-location-dot"></i> Kathmandu</span>
                        </div>
                        <h3 class="browse-title">Data Analyst Intern</h3>
                        <p class="browse-sub">Everest Analytics</p>
                        <div class="browse-meta">
                            <span><i class="fa-solid fa-briefcase"></i> Part Time</span>
                            <span><i class="fa-regular fa-clock"></i> 4 months</span>
                            <span><i class="fa-solid fa-coins"></i> NPR 20,000 / month</span>
                        </div>
                        <div class="browse-footer">
                            <span class="browse-deadline"><i
                                    class="fa-regular fa-calendar"></i> Deadline Jan 20, 2027</span>
                            <span class="badge badge-applied"><i class="fa-solid fa-check"></i> Applied</span>
                        </div>
                    </div>

                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2>Open Workshops</h2>
                    <div class="panel-actions">
                        <span class="badge badge-workshop">3 Available</span>
                    </div>
                </div>
                <div class="browse-grid">

                    <div class="browse-card">
                        <div class="browse-top">
                            <span class="badge badge-workshop">Workshop</span>
                            <span class="browse-loc"><i
                                    class="fa-solid fa-calendar-days"></i> Starts Nov 14, 2026</span>
                        </div>
                        <h3 class="browse-title">Web Development Bootcamp</h3>
                        <p class="browse-sub">Himalayan Labs</p>
                        <div class="browse-meta">
                            <span><i class="fa-solid fa-location-dot"></i> Online</span>
                            <span><i class="fa-regular fa-clock"></i> 8 weeks</span>
                            <span><i class="fa-solid fa-graduation-cap"></i> Beginner</span>
                        </div>
                        <div class="browse-footer">
                            <span class="browse-deadline"><i
                                    class="fa-regular fa-calendar"></i> Deadline Nov 10, 2026</span>
                            <span class="badge badge-applied"><i class="fa-solid fa-check"></i> Registered</span>
                        </div>
                    </div>

                    <div class="browse-card">
                        <div class="browse-top">
                            <span class="badge badge-workshop">Workshop</span>
                            <span class="browse-loc"><i
                                    class="fa-solid fa-calendar-days"></i> Starts Dec 05, 2026</span>
                        </div>
                        <h3 class="browse-title">Data Science with Python</h3>
                        <p class="browse-sub">Everest Analytics</p>
                        <div class="browse-meta">
                            <span><i class="fa-solid fa-location-dot"></i> Kathmandu</span>
                            <span><i class="fa-regular fa-clock"></i> 6 weeks</span>
                            <span><i class="fa-solid fa-graduation-cap"></i> Intermediate</span>
                        </div>
                        <div class="browse-footer">
                            <span class="browse-deadline"><i
                                    class="fa-regular fa-calendar"></i> Deadline Nov 25, 2026</span>
                            <span class="badge badge-applied"><i class="fa-solid fa-check"></i> Registered</span>
                        </div>
                    </div>

                    <div class="browse-card">
                        <div class="browse-top">
                            <span class="badge badge-workshop">Workshop</span>
                            <span class="browse-loc"><i
                                    class="fa-solid fa-calendar-days"></i> Starts Dec 12, 2026</span>
                        </div>
                        <h3 class="browse-title">UI/UX Design Crash Course</h3>
                        <p class="browse-sub">Craft Nepal</p>
                        <div class="browse-meta">
                            <span><i class="fa-solid fa-location-dot"></i> Online</span>
                            <span><i class="fa-regular fa-clock"></i> 4 weeks</span>
                            <span><i class="fa-solid fa-graduation-cap"></i> Beginner</span>
                        </div>
                        <div class="browse-footer">
                            <span class="browse-deadline"><i
                                    class="fa-regular fa-calendar"></i> Deadline Dec 05, 2026</span>
                            <button class="btn btn-primary btn-sm"><i class="fa-solid fa-paper-plane"></i> Register
                            </button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!-- PAGE: MY APPLICATIONS -->
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
                        <tr>
                            <td><strong>Frontend Developer Intern</strong></td>
                            <td>Himalayan Labs</td>
                            <td>Oct 04, 2026</td>
                            <td><span class="status-pending">Pending</span></td>
                        </tr>
                        <tr>
                            <td><strong>Data Analyst Intern</strong></td>
                            <td>Everest Analytics</td>
                            <td>Sep 27, 2026</td>
                            <td><span class="status-accepted">Accepted</span></td>
                        </tr>
                        <tr>
                            <td><strong>UI/UX Design Intern</strong></td>
                            <td>Craft Nepal</td>
                            <td>Sep 15, 2026</td>
                            <td><span class="status-pending">Pending</span></td>
                        </tr>
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
                        <tr>
                            <td><strong>Web Development Bootcamp</strong></td>
                            <td>Himalayan Labs</td>
                            <td>Oct 01, 2026</td>
                            <td><span class="status-confirmed">Confirmed</span></td>
                        </tr>
                        <tr>
                            <td><strong>Data Science with Python</strong></td>
                            <td>Everest Analytics</td>
                            <td>Sep 20, 2026</td>
                            <td><span class="status-confirmed">Confirmed</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- PAGE: MY PROFILE -->
        <
        <div class="page" id="page-profile">

            <section class="profile-hero">
                <div class="profile-avatar">${student.firstName.substring(0,1)}</div>
                <div class="profile-hero-info">
                    <span class="profile-hero-badge">Student</span>
                    <h1>${student.firstName} ${student.lastName}</h1>
                    <p id="hero-title">Full-stack Developer & UI/UX Enthusiast</p>
                    <div class="profile-hero-meta">
                        <span><i class="fa-solid fa-calendar-days"></i> Member since Oct 2026</span>
                        <span><i class="fa-solid fa-user-graduate"></i> <span
                                id="hero-degree">Year 3, Computer Science</span></span>
                        <span><i class="fa-solid fa-location-dot"></i> <span id="hero-location">Kathmandu, Nepal</span></span>
                    </div>
                    <p class="profile-bio" id="hero-bio">
                        Passionate about building user-friendly web applications and creating meaningful digital
                        experiences.
                        Currently focused on learning modern JavaScript frameworks and contributing to open-source
                        projects.
                    </p>
                    <button class="btn btn-sm btn-outline"
                            style="background: rgba(255,255,255,0.2); border: 1px solid rgba(255,255,255,0.4); color: white; margin-top: 12px;"
                            onclick="editHero()">
                        <i class="fa-solid fa-edit"></i> Edit Profile
                    </button>
                    <div id="hero-edit" class="edit-section"
                         style="display: none; margin-top: 18px; background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);">
                        <input type="text" id="hero-name-input" class="edit-input" placeholder="Full Name"
                               value="Asha Rai">
                        <input type="text" id="hero-title-input" class="edit-input" placeholder="Title"
                               value="Full-stack Developer & UI/UX Enthusiast">
                        <textarea id="hero-bio-input" class="edit-textarea" rows="3" placeholder="Bio">Passionate about building user-friendly web applications and creating meaningful digital experiences. Currently focused on learning modern JavaScript frameworks and contributing to open-source projects.</textarea>
                        <div class="edit-actions">
                            <button class="btn btn-sm btn-primary" onclick="saveHero()">
                                <i class="fa-solid fa-check"></i> Save
                            </button>
                            <button class="btn btn-sm btn-outline" onclick="cancelHero()">
                                <i class="fa-solid fa-times"></i> Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </section>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-user"></i> Personal Information</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="togglePersonalEdit()">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="profile-info-list" id="personal-info">
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-envelope"></i>
                            <span>Email</span>
                        </div>
                        <div class="profile-info-value" id="email-display">asha@example.com</div>
                    </div>
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-phone"></i>
                            <span>Phone</span>
                        </div>
                        <div class="profile-info-value" id="phone-display">+977 9812345678</div>
                    </div>
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-graduation-cap"></i>
                            <span>Institution</span>
                        </div>
                        <div class="profile-info-value" id="institution-display">Kathmandu University</div>
                    </div>
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-book-open"></i>
                            <span>Course / Major</span>
                        </div>
                        <div class="profile-info-value" id="major-display">Computer Science</div>
                    </div>
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-calendar-check"></i>
                            <span>Graduation Year</span>
                        </div>
                        <div class="profile-info-value" id="gradyear-display">2028</div>
                    </div>
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-chart-line"></i>
                            <span>CGPA</span>
                        </div>
                        <div class="profile-info-value" id="cgpa-display">3.8 / 4.0</div>
                    </div>
                    <div class="profile-info-row">
                        <div class="profile-info-label">
                            <i class="fa-solid fa-location-dot"></i>
                            <span>Location</span>
                        </div>
                        <div class="profile-info-value" id="location-display">Kathmandu, Nepal</div>
                    </div>
                </div>
                <div id="personal-edit" class="edit-section" style="display: none; margin-top: 20px;">
                    <div class="edit-grid">
                        <div class="edit-field">
                            <label>Email</label>
                            <input type="email" id="email-input" class="edit-input" value="asha@example.com">
                        </div>
                        <div class="edit-field">
                            <label>Phone</label>
                            <input type="tel" id="phone-input" class="edit-input" value="+977 9812345678">
                        </div>
                        <div class="edit-field">
                            <label>Institution</label>
                            <input type="text" id="institution-input" class="edit-input" value="Kathmandu University">
                        </div>
                        <div class="edit-field">
                            <label>Course / Major</label>
                            <input type="text" id="major-input" class="edit-input" value="Computer Science">
                        </div>
                        <div class="edit-field">
                            <label>Graduation Year</label>
                            <input type="text" id="gradyear-input" class="edit-input" value="2028">
                        </div>
                        <div class="edit-field">
                            <label>CGPA</label>
                            <input type="text" id="cgpa-input" class="edit-input" value="3.8 / 4.0">
                        </div>
                        <div class="edit-field" style="grid-column: 1 / -1;">
                            <label>Location</label>
                            <input type="text" id="location-input" class="edit-input" value="Kathmandu, Nepal">
                        </div>
                    </div>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="savePersonalInfo()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelPersonalEdit()">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-tags"></i> Technical Skills</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('skills')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="skill-tags" id="skills-list">
                    <span class="skill-tag">Web Development</span>
                    <span class="skill-tag">JavaScript</span>
                    <span class="skill-tag">TypeScript</span>
                    <span class="skill-tag">React</span>
                    <span class="skill-tag">Next.js</span>
                    <span class="skill-tag">Node.js</span>
                    <span class="skill-tag">Python</span>
                    <span class="skill-tag">Figma</span>
                    <span class="skill-tag">Git & GitHub</span>
                    <span class="skill-tag">Tailwind CSS</span>
                </div>
                <div id="skills-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="skills-input" class="edit-textarea" rows="3"
                    placeholder="Enter skills separated by commas (e.g., React, Node.js, Python)"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveSkills()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('skills')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-briefcase"></i> Education</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('education')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="profile-list" id="education-list">
                    <div class="profile-item">
                        <div class="profile-item-icon">
                            <i class="fa-solid fa-graduation-cap"></i>
                        </div>
                        <div class="profile-item-content">
                            <h4>Bachelor of Computer Science</h4>
                            <p>Kathmandu University - School of Engineering</p>
                            <div class="profile-item-meta">
                                <span><i class="fa-solid fa-calendar"></i> 2024 - Present</span>
                                <span><i class="fa-solid fa-location-dot"></i> Dhulikhel, Nepal</span>
                                <span><i class="fa-solid fa-star"></i> CGPA: 3.8/4.0</span>
                            </div>
                        </div>
                    </div>
                    <div class="profile-item">
                        <div class="profile-item-icon">
                            <i class="fa-solid fa-school"></i>
                        </div>
                        <div class="profile-item-content">
                            <h4>Higher Secondary Education (+2)</h4>
                            <p>St. Xavier's College</p>
                            <div class="profile-item-meta">
                                <span><i class="fa-solid fa-calendar"></i> 2022 - 2024</span>
                                <span><i class="fa-solid fa-location-dot"></i> Kathmandu, Nepal</span>
                                <span><i class="fa-solid fa-award"></i> Grade: A</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="education-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="education-input" class="edit-textarea" rows="6"
                    placeholder="Enter education details (e.g., Degree | School | Year | Location | Grade)"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveEducation()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('education')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-lightbulb"></i> Projects</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('projects')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="profile-list" id="projects-list">
                    <div class="profile-item">
                        <div class="profile-item-icon">
                            <i class="fa-solid fa-code"></i>
                        </div>
                        <div class="profile-item-content">
                            <h4>SkillBridge - Career Platform</h4>
                            <p>A full-stack platform connecting students with internships and workshops. Built with
                                modern web
                                technologies.</p>
                            <div class="profile-item-meta">
                                <span><i class="fa-solid fa-tags"></i> HTML, CSS, JavaScript</span>
                                <span><i class="fa-solid fa-calendar"></i> Oct 2026</span>
                            </div>
                            <a href="#" class="profile-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> View
                                Project</a>
                        </div>
                    </div>
                    <div class="profile-item">
                        <div class="profile-item-icon">
                            <i class="fa-solid fa-laptop-code"></i>
                        </div>
                        <div class="profile-item-content">
                            <h4>Task Management App</h4>
                            <p>Responsive task manager with drag-and-drop functionality and local storage
                                integration.</p>
                            <div class="profile-item-meta">
                                <span><i class="fa-solid fa-tags"></i> React, Tailwind CSS</span>
                                <span><i class="fa-solid fa-calendar"></i> Sep 2026</span>
                            </div>
                            <a href="#" class="profile-link"><i class="fa-solid fa-arrow-up-right-from-square"></i> View
                                Project</a>
                        </div>
                    </div>
                </div>
                <div id="projects-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="projects-input" class="edit-textarea" rows="6"
                    placeholder="Enter project details (name | description | tech | date | link)"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveProjects()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('projects')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-certificate"></i> Certifications & Achievements</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('certifications')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="profile-list" id="certifications-list">
                    <div class="profile-item">
                        <div class="profile-item-icon">
                            <i class="fa-solid fa-trophy"></i>
                        </div>
                        <div class="profile-item-content">
                            <h4>Web Development Fundamentals</h4>
                            <p>FreeCodeCamp</p>
                            <div class="profile-item-meta">
                                <span><i class="fa-solid fa-calendar"></i> August 2026</span>
                                <span><i class="fa-solid fa-clock"></i> 300+ hours</span>
                            </div>
                            <span class="certification-badge"><i class="fa-solid fa-check-circle"></i> Verified</span>
                        </div>
                    </div>
                    <div class="profile-item">
                        <div class="profile-item-icon">
                            <i class="fa-solid fa-medal"></i>
                        </div>
                        <div class="profile-item-content">
                            <h4>Hackathon Participant</h4>
                            <p>KU Tech Fest 2026</p>
                            <div class="profile-item-meta">
                                <span><i class="fa-solid fa-calendar"></i> May 2026</span>
                                <span><i class="fa-solid fa-users"></i> Team Project</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="certifications-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="certifications-input" class="edit-textarea" rows="6"
                    placeholder="Enter certifications (name | issuer | date | details)"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveCertifications()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('certifications')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-language"></i> Languages</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('languages')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="language-list" id="languages-list">
                    <div class="language-item">
                        <strong>Nepali</strong>
                        <span>Native</span>
                    </div>
                    <div class="language-item">
                        <strong>English</strong>
                        <span>Professional Working</span>
                    </div>
                    <div class="language-item">
                        <strong>Hindi</strong>
                        <span>Conversational</span>
                    </div>
                </div>
                <div id="languages-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="languages-input" class="edit-textarea" rows="3"
                    placeholder="Enter languages (e.g., Nepali: Native, English: Fluent)"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveLanguages()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('languages')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-heart"></i> Interests & Hobbies</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('interests')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="skill-tags" id="interests-list">
                    <span class="skill-tag">Open Source</span>
                    <span class="skill-tag">UI/UX Design</span>
                    <span class="skill-tag">Photography</span>
                    <span class="skill-tag">Reading</span>
                    <span class="skill-tag">Travel</span>
                    <span class="skill-tag">Music</span>
                </div>
                <div id="interests-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="interests-input" class="edit-textarea" rows="2"
                    placeholder="Enter interests separated by commas"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveInterests()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('interests')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-header">
                    <h2><i class="fa-solid fa-link"></i> Connect & Links</h2>
                    <div class="panel-actions">
                        <button class="btn btn-sm btn-outline" onclick="editSection('links')">
                            <i class="fa-solid fa-edit"></i> Edit
                        </button>
                    </div>
                </div>
                <div class="social-links" id="links-list">
                    <a href="#" class="social-link"><i class="fa-brands fa-github"></i> GitHub</a>
                    <a href="#" class="social-link"><i class="fa-brands fa-linkedin"></i> LinkedIn</a>
                    <a href="#" class="social-link"><i class="fa-brands fa-behance"></i> Behance</a>
                    <a href="#" class="social-link"><i class="fa-solid fa-globe"></i> Portfolio</a>
                    <a href="#" class="social-link"><i class="fa-brands fa-x-twitter"></i> X (Twitter)</a>
                </div>
                <div id="links-edit" class="edit-section" style="display: none; margin-top: 18px;">
          <textarea id="links-input" class="edit-textarea" rows="4"
                    placeholder="Enter links (e.g., GitHub: https://github.com/username)"></textarea>
                    <div class="edit-actions">
                        <button class="btn btn-sm btn-primary" onclick="saveLinks()">
                            <i class="fa-solid fa-check"></i> Save
                        </button>
                        <button class="btn btn-sm btn-outline" onclick="cancelEdit('links')">
                            <i class="fa-solid fa-times"></i> Cancel
                        </button>
                    </div>
                </div>
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
