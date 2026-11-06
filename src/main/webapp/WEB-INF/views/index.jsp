<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 09/10/2026
  Time: 11:04 PM
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
<section class="main">
    <div class="content">
        <span class="hero-badge">
            STUDENT OPPORTUNITY PLATFORM
        </span>
        <h1 class="main-content">
            Discover <span class="text-brand-dark">Opportunities</span>
            <span class="block">
                Learn Skills.
                <span class="gradient-text">Build Future.</span>
            </span>
        </h1>
        <p class="side-content">
            SkillBridge is a web-based Student Event and Opportunity Management System that brings internships,
            workshops registrations together in one easy-to-use platform for students.
        </p>
        <div class="cta-buttons">
            <a href="#opportunities" class="btn btn-primary">
                Explore Opportunities
                <i class="fa-solid fa-arrow-right"></i>
            </a>
            <a href="${cp}/about" class="btn btn-outline">
                <i class="fa-solid fa-play"></i>
                Learn More
            </a>
        </div>
    </div>
    <div class="content-image">
        <div class="hero-visual">
            <div class="blob blob-1"></div>
            <div class="blob blob-2"></div>
            <div class="blob blob-3"></div>
            <img src="${cp}/assets/images/header.webp" alt="Student">
            <div class="float-card rating">
                <div class="stat"><span class="num">10K+</span><span>Alumni</span></div>
                <div class="stat">
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <span class="num">4.6</span>
                    </div>
                    <span>5K+ Reviews</span>
                </div>
                <div class="stat"><span class="num">100+</span><span>Partnerships</span></div>
            </div>
            <div class="float-chip">
                <span class="chip-icon">
                    <i class="fa-solid fa-check"></i>
                </span>
                <span>
                    <span class="chip-title">Application sent!</span>
                    <span class="chip-sub">Track it on your dashboard</span>
                </span>
            </div>
        </div>
    </div>
</section>
<section class="timeline" id="why-us">
    <div class="timeline-text">
        <h4>Why Choose Us</h4>
        <h1>Why Students Choose<br>SkillBridge</h1>
        <p>Four simple reasons that make us the home of your next<br>big opportunity</p>
    </div>
    <div class="timeline-card">
        <div class="tcard-content">
            <span class="tcard-icon"><i class="fa-solid fa-user-gear"></i></span>
            <h3>Personalized Discovery</h3>
            <p>Opportunities matched to your skills, interests and goals</p>
            <a href="${cp}/opportunity">Explore <i class="fa-solid fa-arrow-right"></i></a>
        </div>
        <div class="tcard-content">
            <span class="tcard-icon"><i class="fa-solid fa-shield-halved"></i></span>
            <h3>Verified Opportunities</h3>
            <p>Hand-picked internships, workshops and events from trusted partners</p>
            <a href="${cp}/opportunity">Explore <i class="fa-solid fa-arrow-right"></i></a>
        </div>
        <div class="tcard-content">
            <span class="tcard-icon"><i class="fa-solid fa-bolt"></i></span>
            <h3>Easy Applications</h3>
            <p>Apply to opportunities in just a few clicks</p>
            <a href="${cp}/opportunity">Explore <i class="fa-solid fa-arrow-right"></i></a>
        </div>
        <div class="tcard-content">
            <span class="tcard-icon"><i class="fa-solid fa-clipboard-list"></i></span>
            <h3>Track Everything</h3>
            <p>Follow your applications and deadlines in one dashboard</p>
            <a href="${cp}/opportunity">Explore <i class="fa-solid fa-arrow-right"></i></a>
        </div>
    </div>
</section>
<section class="opportunities" id="opportunities">
    <div class="opportunities-header">
        <h4>Latest Opportunities</h4>
        <h1>Find What's Trending<br>This Week</h1>
        <p>Browse the newest internships, workshops and events<br>added by our partners</p>
    </div>
    <div class="opp-tabs">
        <p class="opp-tab" data-filter="all">Trending Opportunities</p>
    </div>
    <div class="opp-grid">
        <c:forEach items="${trendingInternships}" var="intern">
            <div class="opp-card" data-summary="<c:out value='${intern.description}'/>" data-type="internship">
                <div class="opp-card-top">
                    <span class="opp-badge">Internship</span>
                    <span class="opp-bookmark"><i class="fa-regular fa-bookmark"></i></span>
                </div>
                <h3 class="opp-title"><c:out value="${intern.title}"/></h3>
                <p class="opp-company"><c:out value="${intern.company}"/></p>
                <div class="opp-meta">
                    <span><i class="fa-solid fa-location-dot"></i> <c:out value="${intern.location}"/></span>
                    <span><i class="fa-solid fa-briefcase"></i> <c:out value="${intern.type != null ? intern.type.displayName : 'Internship'}"/></span>
                    <span><i class="fa-regular fa-clock"></i> <c:out value="${intern.duration}"/></span>
                </div>
                <div class="opp-card-bottom">
                    <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: <c:out value="${intern.deadline}"/></span>
                    <c:choose>
                        <c:when test="${not empty student}">
                            <form method="post" action="${cp}/student/internships/${intern.id}/apply" class="inline-form">
                                <button type="submit" class="opp-apply">Apply <i class="fa-solid fa-arrow-right"></i></button>
                            </form>
                        </c:when>
                        <c:otherwise><a href="${cp}/login" class="opp-apply">Login to Apply <i class="fa-solid fa-arrow-right"></i></a></c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>

        <c:forEach items="${trendingWorkshops}" var="workshop">
            <div class="opp-card workshop" data-summary="<c:out value='${workshop.description}'/>" data-type="workshop">
                <div class="opp-card-top">
                    <span class="opp-badge">Workshop</span>
                    <span class="opp-bookmark"><i class="fa-regular fa-bookmark"></i></span>
                </div>
                <h3 class="opp-title"><c:out value="${workshop.title}"/></h3>
                <p class="opp-company"><c:out value="${workshop.organizer}"/></p>
                <div class="opp-meta">
                    <span><i class="fa-solid fa-location-dot"></i> <c:out value="${workshop.location}"/></span>
                    <span><i class="fa-solid fa-chalkboard-user"></i> <c:out value="${workshop.level != null ? workshop.level.displayName : 'All Levels'}"/></span>
                    <span><i class="fa-regular fa-clock"></i> <c:out value="${workshop.duration}"/></span>
                </div>
                <div class="opp-card-bottom">
                    <span class="opp-deadline"><i class="fa-regular fa-calendar"></i> Deadline: <c:out value="${workshop.deadline}"/></span>
                    <c:choose>
                        <c:when test="${not empty student}">
                            <form method="post" action="${cp}/student/workshops/${workshop.id}/register" class="inline-form">
                                <button type="submit" class="opp-apply">Register <i class="fa-solid fa-arrow-right"></i></button>
                            </form>
                        </c:when>
                        <c:otherwise><a href="${cp}/login" class="opp-apply">Login to Register <i class="fa-solid fa-arrow-right"></i></a></c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty trendingInternships and empty trendingWorkshops}">
            <div class="empty-state">
                <p>No opportunities have been posted yet. Check back soon!</p>
            </div>
        </c:if>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script src="${cp}/assets/js/navbar.js"></script>
</body>
</html>
