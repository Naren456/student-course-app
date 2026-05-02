package com.example.student_course_app.service.impl;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.entity.Student;
import com.example.student_course_app.exception.DuplicateEmailException;
import com.example.student_course_app.exception.EntityNotFoundException;
import com.example.student_course_app.repository.CourseRepository;
import com.example.student_course_app.repository.StudentRepository;
import com.example.student_course_app.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    private final StudentRepository studentRepository;
    private final CourseRepository courseRepository;

    @Autowired
    public StudentServiceImpl(StudentRepository studentRepository, CourseRepository courseRepository) {
        this.studentRepository = studentRepository;
        this.courseRepository = courseRepository;
    }

    @Override
    public Student createStudent(Student student) {
        if (studentRepository.findByEmail(student.getEmail()).isPresent()) {
            throw new DuplicateEmailException("Student with email " + student.getEmail() + " already exists");
        }
        return studentRepository.save(student);
    }

    @Override
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public Student getStudentById(Long id) {
        return studentRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Student not found with id: " + id));
    }

    @Override
    public List<Student> getStudentsByCourse(Long courseId) {
        return studentRepository.findByCoursesId(courseId);
    }

    @Override
    public Student updateStudent(Long id, Student studentDetails) {
        Student student = getStudentById(id);
        
        // Check if email is being changed and if new email already exists
        if (!student.getEmail().equals(studentDetails.getEmail()) && 
            studentRepository.findByEmail(studentDetails.getEmail()).isPresent()) {
            throw new DuplicateEmailException("Student with email " + studentDetails.getEmail() + " already exists");
        }

        student.setName(studentDetails.getName());
        student.setEmail(studentDetails.getEmail());
        student.setAge(studentDetails.getAge());
        student.setDepartment(studentDetails.getDepartment());
        
        return studentRepository.save(student);
    }

    @Override
    public void enrollInCourse(Long studentId, Long courseId) {
        Student student = getStudentById(studentId);
        Course course = courseRepository.findById(courseId)
                .orElseThrow(() -> new EntityNotFoundException("Course not found with id: " + courseId));
        
        student.addCourse(course);
        studentRepository.save(student);
    }
}
