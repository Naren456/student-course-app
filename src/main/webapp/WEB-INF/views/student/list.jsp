<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/students" class="btn btn-primary">Students</a>
        <a href="/courses" class="btn btn-secondary">Courses</a>
    </div>

    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
            <h2>Student Management</h2>
            <a href="/students/new" class="btn btn-primary">+ Add New Student</a>
        </div>


    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Age</th>
            <th>Department</th>
            <th>Courses</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.email}</td>
                <td>${student.age}</td>
                <td>${student.department}</td>
                <td>
                    <c:forEach var="course" items="${student.courses}">
                        <span class="badge">${course.code}</span>
                    </c:forEach>
                </td>
                <td>
                    <div class="actions">
                        <a href="/students/edit/${student.id}" class="btn btn-warning" style="padding: 6px 12px;">Edit</a>
                        <a href="/students/view-enroll/${student.id}" class="btn btn-success" style="padding: 6px 12px;">Enroll</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
</div>
</body>

</html>
