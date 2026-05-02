<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course List</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/students" class="btn btn-secondary">Students</a>
        <a href="/courses" class="btn btn-primary">Courses</a>
    </div>

    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
            <h2>Course Management</h2>
            <a href="/courses/new" class="btn btn-primary">+ Add New Course</a>
        </div>

    <table>
        <thead>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Credits</th>
            <th>Description</th>
            <th>Enrolled</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td><span class="badge">${course.code}</span></td>
                <td>${course.name}</td>
                <td>${course.credits}</td>
                <td>${course.description}</td>
                <td>${course.students.size()}</td>
                <td>
                    <div class="actions">
                        <a href="/courses/edit/${course.id}" class="btn btn-warning" style="padding: 6px 12px;">Edit</a>
                        <a href="/courses/${course.id}/students" class="btn btn-success" style="padding: 6px 12px;">Students</a>
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
