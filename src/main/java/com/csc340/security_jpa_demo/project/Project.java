package com.csc340.security_jpa_demo.project;

import com.csc340.security_jpa_demo.team.Team;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.annotation.Nonnull;
import jakarta.persistence.*;

@Entity
@Table(name = "projects")
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int projectId;


    @ManyToOne()
    @JoinColumn(name = "teamId", nullable = false)
    @JsonBackReference
    private Team team;

    @Column(nullable = false)
    private String title;

    private String description;

    @Column(nullable = false)
    private String status;

    public Project() {

    }

    public Project(Team team, @Nonnull String title, String description, @Nonnull String status) {
        this.team = team;
        this.title = title;
        this.description = description;
        this.status = status;
    }

    public Project(Team team, @Nonnull String title, @Nonnull String status) {
        this.team = team;
        this.title = title;
        this.status = status;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle( String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Project{" +
                "projectId=" + projectId +
                ", team=" + team +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
