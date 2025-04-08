package com.csc340.security_jpa_demo.security;

import com.csc340.security_jpa_demo.student.Student;
import com.csc340.security_jpa_demo.student.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CustomStudentDetailsService implements UserDetailsService {

    @Autowired
    private StudentRepository repo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Student student = repo.findByUsername(username).orElseThrow(()
                -> new UsernameNotFoundException(username + "not found"));
        ArrayList<SimpleGrantedAuthority> authList = new ArrayList<>();
        authList.add(new SimpleGrantedAuthority(student.getRole()));
        return new org.springframework.security.core.userdetails.User(
               student.getUsername(), student.getPassword(), authList);
    }

}