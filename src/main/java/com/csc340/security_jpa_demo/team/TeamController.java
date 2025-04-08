package com.csc340.security_jpa_demo.team;

import com.csc340.security_jpa_demo.project.Project;
import com.csc340.security_jpa_demo.project.ProjectService;
import com.csc340.security_jpa_demo.student.Student;
import com.csc340.security_jpa_demo.student.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/teams")
public class TeamController {

    @Autowired
    private TeamService teamService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ProjectService projectService;


    @GetMapping("/all")
    public Object getAllTeams(Model model) {
        model.addAttribute("teamsList", teamService.getAllTeams());
        model.addAttribute("title", "All Teams");
        return "team/team-list";
    }

    @GetMapping("/{teamId}")
    public Object getTeamById(@PathVariable int teamId, Model model) {
        model.addAttribute("team", teamService.getTeamById(teamId));
        model.addAttribute("teamMembersList", studentService.getStudentsByTeam(teamId));
        model.addAttribute("teamProjectList", projectService.getProjectsByTeam(teamId));
        model.addAttribute("title", "Team #: " + teamId);
        return "team/team-details";
    }

    @PostMapping("/new")
    public Object addNewTeam(Team team) {
        teamService.addNewTeam(team);
        return "redirect:/teams/all";
    }

    @GetMapping("/update/{teamId}")
    public Object showUpdateForm(@PathVariable int teamId, Model model) {
        model.addAttribute("team", teamService.getTeamById(teamId));
        model.addAttribute("title", "Update Team #: " + teamId);
        return "team/team-update";
    }

    @PostMapping("/update/{teamId}")
    public Object updateTeam(@PathVariable int teamId, Team team) {
        teamService.addNewTeam(team);
        return "redirect:/teams/" + teamId;
    }

    @GetMapping("/delete/{teamId}")
    public Object deleteTeamById(@PathVariable int teamId) {
        for (Project project : projectService.getProjectsByTeam(teamId))
            projectService.deleteProjectById(project.getProjectId());
        for (Student student : studentService.getStudentsByTeam(teamId)) {
            student.setTeam(null);
            studentService.addNewStudent(student);
        }
        teamService.deleteTeamById(teamId);
        return "redirect:/teams/all";
    }


}