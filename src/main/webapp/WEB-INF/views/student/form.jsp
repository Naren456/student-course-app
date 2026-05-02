<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>
<div class="container" style="max-width: 700px;">
    <div class="card">
        <h2>Add New Student</h2>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>


    <form:form action="/students/save" method="post" modelAttribute="student">
        <div class="form-group">
            <label>Name:</label>
            <form:input path="name" />
            <form:errors path="name" cssClass="error" />
        </div>
        <div class="form-group">
            <label>Email:</label>
            <form:input path="email" type="email" />
            <form:errors path="email" cssClass="error" />
        </div>
        <div class="form-group">
            <label>Age:</label>
            <form:input path="age" type="number" />
            <form:errors path="age" cssClass="error" />
        </div>
        <div class="form-group">
            <label>Department:</label>
            <form:input path="department" />
            <form:errors path="department" cssClass="error-msg" />
        </div>
        <div class="form-group" style="margin-top: 32px;">
            <button type="submit" class="btn btn-primary">Save Student</button>
            <a href="/students" class="btn btn-secondary">Cancel</a>
        </div>
    </form:form>
    </div>
</div>
</body>

</html>
