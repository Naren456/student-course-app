<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enroll Student</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/students" class="btn btn-secondary">Back to List</a>
    </div>

    <div class="card">
        <h2>Enroll Student in Courses</h2>

        <div class="alert alert-info" style="background-color: #f1f5f9; border: 1px solid var(--border); color: var(--text-main);">
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
                    <td><span class="badge">${course.code}</span></td>
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
                                <span style="color: var(--success); font-weight: 700;">Enrolled</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: var(--text-muted);">Not Enrolled</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${isEnrolled}">
                                <button class="btn btn-secondary" style="opacity: 0.5; cursor: not-allowed;" disabled>Enrolled</button>
                            </c:when>
                            <c:otherwise>
                                <a href="/students/enroll/${student.id}/${course.id}" class="btn btn-success" style="padding: 6px 12px;">Enroll Now</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

