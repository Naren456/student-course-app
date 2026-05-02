<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Students in Course</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 800px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { color: #333; border-bottom: 2px solid #28a745; padding-bottom: 10px; }
        .info { background: #e9ecef; padding: 15px; border-radius: 4px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; }
        .btn { display: inline-block; padding: 10px 20px; text-decoration: none; border-radius: 4px; transition: 0.3s; cursor: pointer; border: none; font-size: 14px; }
        .btn-secondary { background-color: #6c757d; color: white; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Students Enrolled in ${course.name}</h2>

    <div class="info">
        <strong>Course Code:</strong> ${course.code}<br>
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

    <a href="/courses" class="btn btn-secondary">Back to Courses</a>
</div>
</body>
</html>
