package com.csc340.security_jpa_demo.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    @Autowired
    public ProjectRepository projectRepository;

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public Project getProjectById(int projectId) {
        return projectRepository.findById(projectId).orElse(null);
    }

    public void addNewProject(Project project) {
        projectRepository.save(project);
    }

    public void deleteProjectById(int projectId) {
        projectRepository.deleteById(projectId);
    }

    public List<Project> getProjectsByTeam(int teamId) {
        return projectRepository.findByTeamId(teamId);
    }
}
