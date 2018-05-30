package ua.com.meraya.grouper.database.service;

import org.springframework.stereotype.Service;
import ua.com.meraya.grouper.database.entity.Group;
import ua.com.meraya.grouper.database.entity.University;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.repository.GroupRepository;
import ua.com.meraya.grouper.database.repository.UniversityRepository;
import ua.com.meraya.grouper.database.repository.UserRepository;

import java.util.Set;

@Service
public class GroupService {

    private final GroupRepository groupRepository;
    private final UniversityRepository universityRepository;
    private final UserRepository userRepository;

    public GroupService(GroupRepository groupRepository, UniversityRepository universityRepository,
                        UserRepository userRepository) {
        this.groupRepository = groupRepository;
        this.universityRepository = universityRepository;
        this.userRepository = userRepository;
    }

    public Group findByNameAndUniversity(String name, University university) {
        return groupRepository.findByNameAndUniversity(name, university);
    }

    public void addGroup(String name, String abbreviation, User user, String univer) {
        University university = universityRepository.findByName(univer);
        Group group = new Group(name, abbreviation, user, university);
        groupRepository.save(group);
        group = groupRepository.findByAbbreviationAndName(abbreviation, name);
        university.getGroups().add(group);
        universityRepository.save(university);

        user = userRepository.findByUsername(user.getUsername());
        user.setBound(true);
        user.setGroup(group);
        userRepository.save(user);
    }

    public void updateGroup(Group group) {
        groupRepository.save(group);
    }

    public void addStatUserIntoGroup(String g, User user) {
        Group group = groupRepository.findByNameAndUniversity(g, user.getUniversity());
        user.setStat(true);
        userRepository.save(user);
        Set<User> statements = group.getStatements();
        statements.add(user);
        group.setStat(group.getStat() + 1);
    }

    public void deleteStutUserIntoGroup(Group group, User user) {
        user.setStat(false);
        userRepository.save(user);
        Set<User> statements = group.getStatements();
        statements.remove(user);
        group.setStat(group.getStat() - 1);
    }

    public void addUserIntoGroup(Group group, User user) {
        Set<User> students = group.getStudents();
        students.add(user);
        group.setStudents(students);

        user.setStat(false);
        user.setGroup(group);
    }
}