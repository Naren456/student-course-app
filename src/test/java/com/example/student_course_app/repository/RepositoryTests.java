package com.example.student_course_app.repository;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.entity.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
public class RepositoryTests {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Test
    public void testFindStudentsByCourseId() {
        Course course = new Course("Test Course", "TC101", 3, "Desc");
        course = courseRepository.save(course);

        Student student = new Student("Test Student", "test@example.com", 20, "CS");
        student.addCourse(course);
        studentRepository.save(student);

        List<Student> students = studentRepository.findByCoursesId(course.getId());
        assertThat(students).hasSize(1);
        assertThat(students.get(0).getName()).isEqualTo("Test Student");
    }

    @Test
    public void testFindByEmail() {
        Student student = new Student("Email Student", "unique@example.com", 20, "CS");
        studentRepository.save(student);

        Optional<Student> found = studentRepository.findByEmail("unique@example.com");
        assertThat(found).isPresent();
        assertThat(found.get().getName()).isEqualTo("Email Student");
    }

    @Test
    public void testFindCoursesByStudentId() {
        Student student = new Student("Course Student", "cstudent@example.com", 20, "CS");
        student = studentRepository.save(student);

        Course course = new Course("Course One", "CO101", 4, "Desc");
        student.addCourse(course);
        studentRepository.save(student);

        List<Course> courses = courseRepository.findByStudentsId(student.getId());
        assertThat(courses).hasSize(1);
        assertThat(courses.get(0).getCode()).isEqualTo("CO101");
    }
}
