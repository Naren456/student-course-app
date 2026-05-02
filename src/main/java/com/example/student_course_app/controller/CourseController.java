package com.example.student_course_app.controller;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.service.CourseService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/courses")
public class CourseController {

    private final CourseService courseService;

    @Autowired
    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "course/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("course", new Course());
        return "course/form";
    }

    @PostMapping("/save")
    public String saveCourse(@Valid @ModelAttribute("course") Course course, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "course/form";
        }
        try {
            courseService.createCourse(course);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "course/form";
        }
        return "redirect:/courses";
    }

    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Course course = courseService.getCourseById(id);
        model.addAttribute("course", course);
        return "course/update";
    }

    @PostMapping("/update/{id}")
    public String updateCourse(@PathVariable Long id, @Valid @ModelAttribute("course") Course course, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "course/update";
        }
        try {
            courseService.updateCourse(id, course);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "course/update";
        }
        return "redirect:/courses";
    }
}
