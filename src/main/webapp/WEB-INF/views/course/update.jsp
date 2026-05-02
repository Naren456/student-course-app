<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Course</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container" style="max-width: 700px;">
    <div class="card">
    <h2>Update Course</h2>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form:form action="/courses/update/${course.id}" method="post" modelAttribute="course">
        <div class="form-group">
            <label>Course Code:</label>
            <form:input path="code" />
            <form:errors path="code" cssClass="error-msg" />
        </div>
        <div class="form-group">
            <label>Course Name:</label>
            <form:input path="name" />
            <form:errors path="name" cssClass="error-msg" />
        </div>
        <div class="form-group">
            <label>Credits:</label>
            <form:input path="credits" type="number" />
            <form:errors path="credits" cssClass="error-msg" />
        </div>
        <div class="form-group">
            <label>Description:</label>
            <form:textarea path="description" rows="3" />
            <form:errors path="description" cssClass="error-msg" />
        </div>
        <div class="form-group" style="margin-top: 32px;">
            <button type="submit" class="btn btn-warning">Update Course</button>
            <a href="/courses" class="btn btn-secondary">Cancel</a>
        </div>
    </form:form>
    </div>
</div>
</body>
</html>

