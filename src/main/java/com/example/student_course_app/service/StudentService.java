package com.example.student_course_app.service;

import com.example.student_course_app.entity.Student;
import java.util.List;

public interface StudentService {
    Student createStudent(Student student);
    List<Student> getAllStudents();
    Student getStudentById(Long id);
    List<Student> getStudentsByCourse(Long courseId);
    Student updateStudent(Long id, Student studentDetails);
    void enrollInCourse(Long studentId, Long courseId);
}
