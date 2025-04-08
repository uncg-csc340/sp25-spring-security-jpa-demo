package com.csc340.security_jpa_demo.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * StudentService.java
 * Centralizes data access to the Student Database.
 */
@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
     * Fetch all Students.
     *
     * @return the list of all Students.
     */
    public List<Student> getAllStudents() {

        return studentRepository.findAll();
    }

    /**
     * Fetch a unique student.
     *
     * @param studentId the unique Student id.
     * @return a unique Student object.
     */
    public Student getStudentById(int studentId) {

        return studentRepository.findById(studentId).orElse(null);
    }

    /**
     * Fetch all students whose major matches the search term.
     *
     * @param major the search key.
     * @return the list of matching Students.
     */
    public List<Student> getStudentsByMajor(String major) {

        return studentRepository.getStudentsByMajor(major);
    }


    /**
     * Fetch all students with a GPA above a threshold.
     *
     * @param gpa the threshold
     * @return the list of matching Students
     */
    public List<Student> getHonorsStudents(double gpa) {

        return studentRepository.getHonorsStudents(gpa);
    }



    /**
     * Fetch all students with a name that contains the given string.
     *
     * @param name the search name
     * @return the list of matching Students
     */
    public List<Student> getStudentsByName(String name) {

        return studentRepository.getStudentsByName(name);
    }

    /**
     * Add a new Student to the database.
     *
     * @param student the new Student to add.
     */
    public void addNewStudent(Student student) {
        student.setPassword(passwordEncoder.encode(student.getPassword()));
        studentRepository.save(student);
    }

    /**
     * Update an existing Student.
     *
     * @param student   the new Student details.
     */
    public void updateStudent( Student student) {
        student.setPassword(passwordEncoder.encode(student.getPassword()));
        studentRepository.save(student);
    }

    /**
     * Delete a unique Student.
     *
     * @param studentId the unique Student Id.
     */
    public void deleteStudentById(int studentId) {

        studentRepository.deleteById(studentId);
    }

    public List<Student> getStudentsByTeam(int teamId) {
        return studentRepository.getStudentsByTeamId( teamId);
    }

}