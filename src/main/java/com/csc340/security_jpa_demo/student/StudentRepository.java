package com.csc340.security_jpa_demo.student;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Provides the actual database transactions.
 */
@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {
    Optional<Student> findByUsername(String userName);

    List<Student> getStudentsByMajor(String major);

    @Query(value = "select * from students s where s.gpa >= ?1", nativeQuery = true)
    List<Student> getHonorsStudents(double gpa);

    @Query(value = "select * from students s where s.name like %?1% ", nativeQuery = true)
    List<Student> getStudentsByName(String name);

    @Query(value = "select * from students s where s.team_id = ?1", nativeQuery = true)
    List<Student> getStudentsByTeamId(int teamId);
}
