package com.csc340.security_jpa_demo.team;

import com.csc340.security_jpa_demo.student.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TeamService {

    @Autowired
    private TeamRepository teamRepository;

    @Autowired
    private StudentRepository studentRepository;

    public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }

    public Team getTeamById(int teamId) {
        return teamRepository.findById(teamId).orElse(null);
    }

    public void addNewTeam(Team team) {
        teamRepository.save(team);
    }

    public void deleteTeamById(int teamId) {
        teamRepository.deleteById(teamId);
    }

    public List<Team> getTeamsWithSpace() {
        List<Team> allTeams = getAllTeams();
        return allTeams.stream().filter
                        (team ->
                                team.getCapacity() >
                                        studentRepository.getStudentsByTeamId(team.getTeamId()).size())
                .toList();
    }
}
