package com.example.student_course_app.repository;

import com.example.student_course_app.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findByStudentsId(Long studentId);

    Optional<Course> findByCode(String code);

    List<Course> findByCreditsGreaterThan(Integer credits);
}
