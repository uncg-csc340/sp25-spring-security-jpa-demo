package com.csc340.security_jpa_demo.team;

import com.csc340.security_jpa_demo.project.Project;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "teams")
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int teamId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private int capacity;

    @OneToMany(cascade = CascadeType.ALL,
            mappedBy = "team")

    @JsonManagedReference
    private List<Project> projects
            = new ArrayList<>();


    public Team() {
    }

    public Team(int teamId) {
        this.teamId = teamId;
    }

    public Team(int teamId, String name, int capacity) {
        this.teamId = teamId;
        this.name = name;
        this.capacity = capacity;
    }

    public Team(String name, int capacity) {
        this.name = name;
        this.capacity = capacity;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }

    @Override
    public String toString() {
        return "Team{" +
                "teamId=" + teamId +
                ", name='" + name + '\'' +
                ", capacity=" + capacity +
                '}';
    }
}
