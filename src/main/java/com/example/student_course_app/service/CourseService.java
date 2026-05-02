package com.example.student_course_app.service;

import com.example.student_course_app.entity.Course;
import java.util.List;

public interface CourseService {
    Course createCourse(Course course);
    List<Course> getAllCourses();
    Course getCourseById(Long id);
    List<Course> getCoursesByStudent(Long studentId);
    Course updateCourse(Long id, Course courseDetails);
}
