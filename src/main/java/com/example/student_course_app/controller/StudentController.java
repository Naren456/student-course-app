package com.example.student_course_app.controller;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.entity.Student;
import com.example.student_course_app.service.CourseService;
import com.example.student_course_app.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    private final StudentService studentService;
    private final CourseService courseService;

    @Autowired
    public StudentController(StudentService studentService, CourseService courseService) {
        this.studentService = studentService;
        this.courseService = courseService;
    }

    @GetMapping
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "student/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("student", new Student());
        return "student/form";
    }

    @PostMapping("/save")
    public String saveStudent(@Valid @ModelAttribute("student") Student student, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "student/form";
        }
        try {
            studentService.createStudent(student);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "student/form";
        }
        return "redirect:/students";
    }

    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Student student = studentService.getStudentById(id);
        model.addAttribute("student", student);
        return "student/update";
    }

    @PostMapping("/update/{id}")
    public String updateStudent(@PathVariable Long id, @Valid @ModelAttribute("student") Student student, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "student/update";
        }
        try {
            studentService.updateStudent(id, student);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "student/update";
        }
        return "redirect:/students";
    }

    @GetMapping("/enroll/{studentId}/{courseId}")
    public String enrollInCourse(@PathVariable Long studentId, @PathVariable Long courseId) {
        studentService.enrollInCourse(studentId, courseId);
        return "redirect:/students";
    }

    @GetMapping("/view-enroll/{id}")
    public String viewEnrollment(@PathVariable Long id, Model model) {
        Student student = studentService.getStudentById(id);
        List<Course> allCourses = courseService.getAllCourses();
        model.addAttribute("student", student);
        model.addAttribute("allCourses", allCourses);
        return "student/enroll";
    }
}
