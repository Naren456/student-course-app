package com.example.student_course_app.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "students")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotBlank(message = "Name is required")
    @Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters")
    private String name;

    @Column(unique = true, nullable = false)
    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
    private String email;

    @Min(value = 18, message = "Age must be at least 18")
    @Max(value = 100, message = "Age cannot exceed 100")
    private Integer age;

    @Column(nullable = false)
    @NotBlank(message = "Department is required")
    private String department;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(
        name = "student_courses",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private Set<Course> courses = new HashSet<>();

    public Student() {}

    public Student(String name, String email, Integer age, String department) {
        this.name = name;
        this.email = email;
        this.age = age;
        this.department = department;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public Set<Course> getCourses() { return courses; }
    public void setCourses(Set<Course> courses) { this.courses = courses; }

    public void addCourse(Course course) {
        this.courses.add(course);
        course.getStudents().add(this);
    }

    public void removeCourse(Course course) {
        this.courses.remove(course);
        course.getStudents().remove(this);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Student)) return false;
        return id != null && id.equals(((Student) o).getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
