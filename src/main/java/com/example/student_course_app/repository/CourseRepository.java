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

    @Query("SELECT c FROM Course c JOIN c.students s WHERE s.id = :studentId")
    List<Course> findByStudentsId(@Param("studentId") Long studentId);


    Optional<Course> findByCode(String code);

    List<Course> findByCreditsGreaterThan(Integer credits);
}
