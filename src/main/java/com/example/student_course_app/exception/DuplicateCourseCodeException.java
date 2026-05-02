package com.example.student_course_app.exception;

public class DuplicateCourseCodeException extends RuntimeException {
    public DuplicateCourseCodeException(String message) {
        super(message);
    }
}
