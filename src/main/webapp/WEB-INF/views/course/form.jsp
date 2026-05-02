<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Course</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { color: #333; border-bottom: 2px solid #007bff; padding-bottom: 10px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
        input[type="text"], input[type="number"], textarea {
            width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;
        }
        .error { color: #dc3545; font-size: 12px; margin-top: 5px; }
        .btn { display: inline-block; padding: 10px 20px; text-decoration: none; border-radius: 4px; transition: 0.3s; cursor: pointer; border: none; font-size: 14px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-secondary { background-color: #6c757d; color: white; margin-left: 10px; }
        .error-box { background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 4px; margin-bottom: 15px; border: 1px solid #f5c6cb; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add New Course</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error-box">${errorMessage}</div>
    </c:if>

    <form:form action="/courses/save" method="post" modelAttribute="course">
        <div class="form-group">
            <label>Course Code:</label>
            <form:input path="code" />
            <form:errors path="code" cssClass="error" />
        </div>
        <div class="form-group">
            <label>Course Name:</label>
            <form:input path="name" />
            <form:errors path="name" cssClass="error" />
        </div>
        <div class="form-group">
            <label>Credits:</label>
            <form:input path="credits" type="number" />
            <form:errors path="credits" cssClass="error" />
        </div>
        <div class="form-group">
            <label>Description:</label>
            <form:textarea path="description" rows="3" />
            <form:errors path="description" cssClass="error" />
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Save Course</button>
            <a href="/courses" class="btn btn-secondary">Cancel</a>
        </div>
    </form:form>
</div>
</body>
</html>
