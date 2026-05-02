<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 1000px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { color: #333; border-bottom: 2px solid #007bff; padding-bottom: 10px; }
        .btn { display: inline-block; padding: 10px 20px; text-decoration: none; border-radius: 4px; transition: 0.3s; cursor: pointer; border: none; font-size: 14px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-primary:hover { background-color: #0056b3; }
        .btn-secondary { background-color: #6c757d; color: white; margin-left: 10px; }
        .btn-edit { background-color: #ffc107; color: #212529; }
        .btn-enroll { background-color: #28a745; color: white; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; color: #495057; }
        tr:hover { background-color: #f1f3f5; }
        .actions { display: flex; gap: 5px; }
        .nav { margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/students" class="btn btn-primary">Students</a>
        <a href="/courses" class="btn btn-primary">Courses</a>
    </div>

    <h2>Student Management</h2>
    <a href="/students/new" class="btn btn-primary">Add New Student</a>

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
                        <span style="background: #e9ecef; padding: 2px 6px; border-radius: 4px; font-size: 12px; margin-right: 3px;">${course.code}</span>
                    </c:forEach>
                </td>
                <td class="actions">
                    <a href="/students/edit/${student.id}" class="btn btn-edit">Edit</a>
                    <a href="/students/view-enroll/${student.id}" class="btn btn-enroll">Enroll</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
