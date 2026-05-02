package com.example.student_course_app.service;

import com.example.student_course_app.entity.Student;
import com.example.student_course_app.exception.DuplicateEmailException;
import com.example.student_course_app.repository.CourseRepository;
import com.example.student_course_app.repository.StudentRepository;
import com.example.student_course_app.service.impl.StudentServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

public class ServiceTests {

    @Mock
    private StudentRepository studentRepository;

    @Mock
    private CourseRepository courseRepository;

    @InjectMocks
    private StudentServiceImpl studentService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testCreateStudent_Success() {
        Student student = new Student("New Student", "new@example.com", 20, "CS");
        when(studentRepository.findByEmail(student.getEmail())).thenReturn(Optional.empty());
        when(studentRepository.save(any(Student.class))).thenReturn(student);

        Student created = studentService.createStudent(student);
        assertThat(created.getName()).isEqualTo("New Student");
        verify(studentRepository, times(1)).save(student);
    }

    @Test
    public void testCreateStudent_DuplicateEmail() {
        Student student = new Student("Dup Student", "dup@example.com", 20, "CS");
        when(studentRepository.findByEmail(student.getEmail())).thenReturn(Optional.of(student));

        assertThatThrownBy(() -> studentService.createStudent(student))
                .isInstanceOf(DuplicateEmailException.class)
                .hasMessageContaining("already exists");
        
        verify(studentRepository, never()).save(any(Student.class));
    }

    @Test
    public void testUpdateStudent() {
        Student existing = new Student("Old Name", "old@example.com", 20, "CS");
        existing.setId(1L);
        
        Student details = new Student("New Name", "old@example.com", 21, "Math");
        
        when(studentRepository.findById(1L)).thenReturn(Optional.of(existing));
        when(studentRepository.save(any(Student.class))).thenReturn(existing);

        Student updated = studentService.updateStudent(1L, details);
        assertThat(updated.getName()).isEqualTo("New Name");
        assertThat(updated.getAge()).isEqualTo(21);
    }
}
