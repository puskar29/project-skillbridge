<c:choose>
  <c:when test="${not empty student.profileImage}">
    <img class="dashboard-profile-avatar"
         src="${cp}/uploads/profile/${student.profileImage}"
         alt="${student.firstName} ${student.lastName}">
  </c:when>
  <c:otherwise>
    <div class="admin-avatar" title="${student.firstName} ${student.lastName}">
      ${empty student.firstName ? 'S' : student.firstName.substring(0, 1)}
    </div>
  </c:otherwise>
</c:choose>
