package com.csc340.security_jpa_demo.student;

import com.csc340.security_jpa_demo.team.Team;
import jakarta.persistence.*;

@Entity
@Table(name = "students")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int studentId;

    @Column(nullable = false)
    private String name;

    private String major;

    @Column(nullable = false)
    private double gpa;


    @ManyToOne
    @JoinColumn(name = "teamId")
    private Team team;

    @Column(unique = true, nullable = false)
    private String username;

    private String password;

    private String role;


    public Student(int studentId, String name, String major, double gpa) {
        this.studentId = studentId;
        this.name = name;
        this.major = major;
        this.gpa = gpa;
    }

    public Student(int studentId, String name, String major, double gpa, Team team, String role, String username, String password) {
        this.studentId = studentId;
        this.name = name;
        this.major = major;
        this.gpa = gpa;
        this.team = team;
        this.role = role;
        this.username=username;
        this.password = password;
    }

    public Student(String name, String major, double gpa, Team team, String role, String username, String password) {
        this.name = name;
        this.major = major;
        this.gpa = gpa;
        this.team = team;
        this.role = role;
        this.username=username;
        this.password = password;
    }

    //Always include a no-argument constructor.
    public Student() {
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Student{" +
                "studentId=" + studentId +
                ", name='" + name + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                ", team=" + team +
                ", role='" + role + '\'' +
                '}';
    }
}

