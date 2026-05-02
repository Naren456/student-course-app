package com.example.student_course_app.loader;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.entity.Student;
import com.example.student_course_app.repository.CourseRepository;
import com.example.student_course_app.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

@Component
public class DataLoader implements CommandLineRunner {

    private final StudentRepository studentRepository;
    private final CourseRepository courseRepository;

    @Autowired
    public DataLoader(StudentRepository studentRepository, CourseRepository courseRepository) {
        this.studentRepository = studentRepository;
        this.courseRepository = courseRepository;
    }

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (studentRepository.count() > 0 || courseRepository.count() > 0) {
            return; // Data already loaded
        }

        // Create Courses
        List<Course> courses = Arrays.asList(
                new Course("Java Programming", "J101", 4, "Learn Java fundamentals"),
                new Course("Python Programming", "P201", 3, "Learn Python basics"),
                new Course("Database Design", "D301", 4, "SQL and database concepts"),
                new Course("Web Development", "W401", 5, "HTML, CSS, JavaScript"),
                new Course("Data Structures", "D501", 4, "Advanced algorithms"),
                new Course("Calculus I", "M101", 3, "Differential calculus"),
                new Course("Linear Algebra", "M201", 3, "Matrix operations"),
                new Course("Physics I", "P101", 4, "Mechanics and thermodynamics"),
                new Course("Chemistry I", "C101", 4, "Organic chemistry"),
                new Course("English Literature", "E101", 2, "Shakespeare and modern poetry")
        );
        courseRepository.saveAll(courses);

        // Create Students
        List<Student> students = Arrays.asList(
                new Student("John Doe", "john@example.com", 20, "Computer Science"),
                new Student("Jane Smith", "jane@example.com", 22, "Mathematics"),
                new Student("Bob Johnson", "bob@example.com", 19, "Physics"),
                new Student("Alice Williams", "alice@example.com", 21, "Computer Science"),
                new Student("Charlie Brown", "charlie@example.com", 23, "Chemistry"),
                new Student("Diana Prince", "diana@example.com", 20, "Mathematics"),
                new Student("Edward Norton", "edward@example.com", 22, "Physics"),
                new Student("Fiona Apple", "fiona@example.com", 21, "Biology"),
                new Student("George Lucas", "george@example.com", 24, "Computer Science"),
                new Student("Helen Keller", "helen@example.com", 25, "History")
        );
        studentRepository.saveAll(students);

        // Add Enrollments
        Student john = studentRepository.findByEmail("john@example.com").get();
        john.addCourse(courseRepository.findByCode("J101").get());
        john.addCourse(courseRepository.findByCode("D301").get());
        
        Student jane = studentRepository.findByEmail("jane@example.com").get();
        jane.addCourse(courseRepository.findByCode("M101").get());
        jane.addCourse(courseRepository.findByCode("M201").get());

        Student bob = studentRepository.findByEmail("bob@example.com").get();
        bob.addCourse(courseRepository.findByCode("P101").get());
        
        studentRepository.saveAll(Arrays.asList(john, jane, bob));
        
        System.out.println("Sample data loaded successfully!");
    }
}
