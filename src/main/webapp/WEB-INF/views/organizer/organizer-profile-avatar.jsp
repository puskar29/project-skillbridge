<c:choose>
  <c:when test="${not empty organizer.profileImage}">
    <img class="dashboard-profile-avatar"
         src="${cp}/uploads/profile/${organizer.profileImage}"
         alt="${organizer.firstName} ${organizer.lastName}">
  </c:when>
  <c:otherwise>
    <div class="admin-avatar" title="${organizer.firstName} ${organizer.lastName}">
      ${empty organizer.firstName ? 'O' : organizer.firstName.substring(0, 1)}
    </div>
  </c:otherwise>
</c:choose>
