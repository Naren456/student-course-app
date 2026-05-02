<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enroll Student</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 800px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { color: #333; border-bottom: 2px solid #28a745; padding-bottom: 10px; }
        .student-info { background: #e9ecef; padding: 15px; border-radius: 4px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; }
        .btn { display: inline-block; padding: 8px 16px; text-decoration: none; border-radius: 4px; transition: 0.3s; cursor: pointer; border: none; font-size: 13px; }
        .btn-enroll { background-color: #28a745; color: white; }
        .btn-enrolled { background-color: #6c757d; color: white; cursor: default; }
        .btn-secondary { background-color: #6c757d; color: white; margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Enroll Student in Courses</h2>

    <div class="student-info">
        <strong>Student:</strong> ${student.name} (${student.email})<br>
        <strong>Department:</strong> ${student.department}
    </div>

    <table>
        <thead>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Credits</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${allCourses}">
            <tr>
                <td>${course.code}</td>
                <td>${course.name}</td>
                <td>${course.credits}</td>
                <td>
                    <c:set var="isEnrolled" value="false" />
                    <c:forEach var="sc" items="${student.courses}">
                        <c:if test="${sc.id eq course.id}">
                            <c:set var="isEnrolled" value="true" />
                        </c:if>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${isEnrolled}">
                            <span style="color: green; font-weight: bold;">Enrolled</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: #888;">Not Enrolled</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${isEnrolled}">
                            <button class="btn btn-enrolled" disabled>Enrolled</button>
                        </c:when>
                        <c:otherwise>
                            <a href="/students/enroll/${student.id}/${course.id}" class="btn btn-enroll">Enroll Now</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/students" class="btn btn-secondary">Back to List</a>
</div>
</body>
</html>
