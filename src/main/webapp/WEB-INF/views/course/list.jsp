<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course List</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 1000px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { color: #333; border-bottom: 2px solid #007bff; padding-bottom: 10px; }
        .btn { display: inline-block; padding: 10px 20px; text-decoration: none; border-radius: 4px; transition: 0.3s; cursor: pointer; border: none; font-size: 14px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-edit { background-color: #ffc107; color: #212529; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; }
        tr:hover { background-color: #f1f3f5; }
        .nav { margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/students" class="btn btn-primary">Students</a>
        <a href="/courses" class="btn btn-primary">Courses</a>
    </div>

    <h2>Course Management</h2>
    <a href="/courses/new" class="btn btn-primary">Add New Course</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Name</th>
            <th>Credits</th>
            <th>Description</th>
            <th>Enrolled Students</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.id}</td>
                <td>${course.code}</td>
                <td>${course.name}</td>
                <td>${course.credits}</td>
                <td>${course.description}</td>
                <td>${course.students.size()}</td>
                <td>
                    <a href="/courses/edit/${course.id}" class="btn btn-edit">Edit</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
