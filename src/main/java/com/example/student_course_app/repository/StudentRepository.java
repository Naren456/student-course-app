package com.example.student_course_app.repository;

import com.example.student_course_app.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

    @Query("SELECT s FROM Student s JOIN s.courses c WHERE c.id = :courseId")
    List<Student> findByCoursesId(@Param("courseId") Long courseId);


    Optional<Student> findByEmail(String email);

    List<Student> findByDepartment(String department);

    List<Student> findByNameContainingIgnoreCase(String name);
}
