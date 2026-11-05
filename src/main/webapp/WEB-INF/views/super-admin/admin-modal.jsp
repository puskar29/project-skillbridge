<%--
  Created by IntelliJ IDEA.
  User: puskarthapamagar
  Date: 10/10/2026
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<div class="modal-overlay" id="actionModal">
    <div class="modal-box">
        <h3 id="actionModalTitle">Are you sure?</h3>
        <p id="actionModalText"></p>
        <div class="field" id="actionModalField" hidden>
            <label id="actionModalLabel" for="actionModalSelect"></label>
            <select id="actionModalSelect"></select>
        </div>
        <div class="modal-actions">
            <button class="btn btn-danger" id="actionModalConfirm">Confirm</button>
            <button class="btn btn-outline" id="actionModalCancel">Cancel</button>
        </div>
    </div>
</div>