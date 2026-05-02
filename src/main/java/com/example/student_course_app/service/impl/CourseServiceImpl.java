package com.example.student_course_app.service.impl;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.exception.DuplicateCourseCodeException;
import com.example.student_course_app.exception.EntityNotFoundException;
import com.example.student_course_app.repository.CourseRepository;
import com.example.student_course_app.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    private final CourseRepository courseRepository;

    @Autowired
    public CourseServiceImpl(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    @Override
    public Course createCourse(Course course) {
        if (courseRepository.findByCode(course.getCode()).isPresent()) {
            throw new DuplicateCourseCodeException("Course with code " + course.getCode() + " already exists");
        }
        return courseRepository.save(course);
    }

    @Override
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    @Override
    public Course getCourseById(Long id) {
        return courseRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Course not found with id: " + id));
    }

    @Override
    public List<Course> getCoursesByStudent(Long studentId) {
        return courseRepository.findByStudentsId(studentId);
    }

    @Override
    public Course updateCourse(Long id, Course courseDetails) {
        Course course = getCourseById(id);

        if (!course.getCode().equals(courseDetails.getCode()) &&
            courseRepository.findByCode(courseDetails.getCode()).isPresent()) {
            throw new DuplicateCourseCodeException("Course with code " + courseDetails.getCode() + " already exists");
        }

        course.setName(courseDetails.getName());
        course.setCode(courseDetails.getCode());
        course.setCredits(courseDetails.getCredits());
        course.setDescription(courseDetails.getDescription());

        return courseRepository.save(course);
    }
}
