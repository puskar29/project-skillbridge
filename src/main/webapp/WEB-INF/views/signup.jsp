<%--
  One signup form for both account types.
  The account type is selected near the end; js/signup.js shows the
  matching field group and disables the other one.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up | SkillBridge</title>
  <link rel="shortcut icon" href="${cp}/assets/images/logo-skillbridge.png" type="image/png" />

  <!-- google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

  <!-- font awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        referrerpolicy="no-referrer" />

  <!-- css -->
  <link rel="stylesheet" href="${cp}/assets/css/style.css" />
</head>

<body class="signup-page">
<jsp:include page="navbar.jsp"></jsp:include>

<main class="auth-main">
  <div class="auth-wrap signup-wrap">
    <div class="auth-card">
      <h1 class="auth-title">Create your account</h1>
      <p class="auth-sub" id="signup-subtitle">
        Join SkillBridge as a student to discover opportunities
      </p>

      <!-- action is handled by AuthController#register -->
      <form id="signupForm" method="post" action="${cp}/auth/register" novalidate>

        <!-- ================= Personal information ================= -->
        <h2 class="section-title">Personal Information</h2>

        <div class="signup-grid">
          <div class="field">
            <label for="first_name">First Name</label>
            <input type="text" id="first_name" name="first_name" placeholder="First Name"
                   autocomplete="given-name" maxlength="60" required>
            <p class="field-error" id="first_name-error"></p>
          </div>
          <div class="field">
            <label for="last_name">Last Name</label>
            <input type="text" id="last_name" name="last_name" placeholder="Last Name"
                   autocomplete="family-name" maxlength="60" required>
            <p class="field-error" id="last_name-error"></p>
          </div>
          <div class="field span-2">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="you@example.com"
                   autocomplete="email" maxlength="120" required>
            <p class="field-error" id="email-error"></p>
          </div>
        </div>

        <div class="signup-grid">
          <div class="field span-2">
            <label for="phone">Phone Number <span class="req">(optional)</span></label>
            <input type="tel" id="phone" name="phone" placeholder="+977 987 654 321"
                   autocomplete="tel" maxlength="20">
            <p class="field-error" id="phone-error"></p>
          </div>
        </div>

        <!-- ================= Student-only fields ================= -->
        <section class="role-panel" data-role-panel="STUDENT">
          <h2 class="section-title">Academic Information</h2>

          <div class="signup-grid">
            <div class="field">
              <label for="dob">Date of Birth</label>
              <input type="date" id="dob" name="dob" autocomplete="bday" required>
              <p class="field-error" id="dob-error"></p>
            </div>
            <div class="field">
              <label for="gender">Gender</label>
              <select id="gender" name="gender" required>
                <option value="">Select</option>
                <option value="MALE">Male</option>
                <option value="FEMALE">Female</option>
                <option value="OTHER">Other</option>
                <option value="PREFER_NOT_TO_SAY">Prefer not to say</option>
              </select>
              <p class="field-error" id="gender-error"></p>
            </div>
            <div class="field">
              <label for="college">College / University</label>
              <input type="text" id="college" name="college" placeholder="e.g. Stanford University"
                     autocomplete="organization" maxlength="120" required>
              <p class="field-error" id="college-error"></p>
            </div>
            <div class="field">
              <label for="major">Course / Major</label>
              <input type="text" id="major" name="major" placeholder="e.g. Computer Science"
                     maxlength="80" required>
              <p class="field-error" id="major-error"></p>
            </div>
          </div>

          <div class="signup-grid">
            <div class="field span-2">
              <label for="graduation_year">Graduation Year</label>
              <input type="number" id="graduation_year" name="graduation_year" min="2026" max="2040"
                     placeholder="e.g. 2028" required>
              <p class="field-error" id="graduation_year-error"></p>
            </div>
            <div class="field span-2">
              <label for="study_year">Year of Study</label>
              <select id="study_year" name="study_year" required>
                <option value="">Select</option>
                <option value="1">1st Year</option>
                <option value="2">2nd Year</option>
                <option value="3">3rd Year</option>
                <option value="4">4th Year</option>
                <option value="5+">5th Year+</option>
                <option value="GRADUATE">Graduate</option>
              </select>
              <p class="field-error" id="study_year-error"></p>
            </div>
          </div>

          <div class="signup-grid">
            <div class="field full">
              <label for="skills">Skills / Interests <span class="req">(optional)</span></label>
              <textarea id="skills" name="skills" rows="1" maxlength="300"
                        placeholder="e.g. Web Development, Graphic Design, Public Speaking"
                        aria-describedby="skills-error"></textarea>
              <p class="field-error" id="skills-error"></p>
            </div>
          </div>
        </section>

        <!-- ================= Organizer-only fields ================= -->
        <section class="role-panel is-hidden" data-role-panel="ORGANIZER" aria-hidden="true">
          <h2 class="section-title">Organization Information</h2>

          <div class="signup-grid">
            <div class="field span-2">
              <label for="organization_name">Organization Name</label>
              <input type="text" id="organization_name" name="organization_name"
                     placeholder="e.g. SkillBridge Academy" maxlength="120" required>
              <p class="field-error" id="organization_name-error"></p>
            </div>
            <div class="field span-2">
              <label for="organization_type">Organization Type</label>
              <select id="organization_type" name="organization_type" required>
                <option value="">Select</option>
                <option value="COMPANY">Company</option>
                <option value="STARTUP">Startup</option>
                <option value="NGO">NGO / Non-profit</option>
                <option value="EDUCATIONAL">Educational Institution</option>
                <option value="GOVERNMENT">Government</option>
                <option value="OTHER">Other</option>
              </select>
              <p class="field-error" id="organization_type-error"></p>
            </div>
          </div>

          <div class="signup-grid">
            <div class="field span-2">
              <label for="position">Your Position / Title</label>
              <input type="text" id="position" name="position"
                     placeholder="e.g. Program Manager" maxlength="80" required>
              <p class="field-error" id="position-error"></p>
            </div>
            <div class="field span-2">
              <label for="website">Website <span class="req">(optional)</span></label>
              <input type="url" id="website" name="website" placeholder="https://example.com"
                     maxlength="160">
              <p class="field-error" id="website-error"></p>
            </div>
          </div>

          <div class="signup-grid">
            <div class="field full">
              <label for="organization_description">About the Organization <span class="req">(optional)</span></label>
              <textarea id="organization_description" name="organization_description" rows="2"
                        maxlength="1000"
                        placeholder="Tell students what your organization does and what opportunities you offer"></textarea>
              <p class="field-error" id="organization_description-error"></p>
            </div>
          </div>
        </section>

        <!-- ================= Account security ================= -->
        <h2 class="section-title">Account Security</h2>

        <div class="signup-grid">
          <div class="field span-2">
            <label for="password">Password</label>
            <div class="password-wrap">
              <input type="password" id="password" name="password"
                     placeholder="At least 8 characters" autocomplete="new-password"
                     minlength="8" maxlength="72" required aria-describedby="password-error">
              <button type="button" class="toggle-pass" data-toggle-for="password"
                      aria-label="Show password" aria-pressed="false">
                <i class="fa-solid fa-eye" aria-hidden="true"></i>
              </button>
            </div>
            <p class="field-error" id="password-error"></p>
          </div>

          <div class="field span-2">
            <label for="confirm_password">Confirm Password</label>
            <div class="password-wrap">
              <input type="password" id="confirm_password" name="confirm_password"
                     placeholder="Repeat your password" autocomplete="new-password"
                     maxlength="72" required aria-describedby="confirm_password-error">
              <button type="button" class="toggle-pass" data-toggle-for="confirm_password"
                      aria-label="Show password" aria-pressed="false">
                <i class="fa-solid fa-eye" aria-hidden="true"></i>
              </button>
            </div>
            <p class="field-error" id="confirm_password-error"></p>
          </div>
        </div>

        <div class="signup-grid">
          <div class="field full">
            <label class="checkbox terms">
              <input type="checkbox" id="terms" name="terms" required aria-describedby="terms-error">
              <span>I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></span>
            </label>
            <p class="field-error" id="terms-error"></p>
          </div>
        </div>

        <div class="signup-grid">
          <div class="field full">
            <label for="role">Account Type</label>
            <select id="role" name="role" required>
              <option value="STUDENT" selected>Student</option>
              <option value="ORGANIZER">Organizer</option>
            </select>
            <p class="field-error" id="role-error"></p>
          </div>
        </div>

        <div class="signup-actions">
          <button type="submit" class="auth-btn" id="signup-submit">Create Student Account</button>
        </div>
      </form>

      <div class="signup-foot">
        <p class="form-note">
          <i class="fa-solid fa-lock" aria-hidden="true"></i>
          We only use these details to match you with relevant opportunities.
        </p>
        <p class="auth-alt">Already have an account? <a href="${cp}/login">Log In</a></p>
      </div>
    </div>
  </div>
</main>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${cp}/assets/js/navbar.js"></script>
<script src="${cp}/assets/js/signup.js"></script>

</body>

</html>
