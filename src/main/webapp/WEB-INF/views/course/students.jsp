<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Students in Course</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/courses" class="btn btn-secondary">Back to Courses</a>
    </div>

    <div class="card">
        <h2>Students Enrolled in ${course.name}</h2>

        <div class="alert alert-info" style="background-color: #f1f5f9; border: 1px solid var(--border); color: var(--text-main);">
            <strong>Course Code:</strong> <span class="badge">${course.code}</span><br>
            <strong>Credits:</strong> ${course.credits}
        </div>


    <c:choose>
        <c:when test="${not empty students}">
            <table>
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.name}</td>
                        <td>${student.email}</td>
                        <td>${student.department}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No students enrolled in this course yet.</p>
        </c:otherwise>
    </c:choose>
    </div>
</div>
</body>
</html>

