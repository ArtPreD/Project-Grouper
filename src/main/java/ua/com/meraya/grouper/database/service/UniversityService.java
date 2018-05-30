package ua.com.meraya.grouper.database.service;

import org.springframework.stereotype.Service;
import ua.com.meraya.grouper.database.entity.University;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.repository.UniversityRepository;

import java.util.List;
import java.util.Set;

@Service
public class UniversityService {

    private final UniversityRepository universityRepository;

    public UniversityService(UniversityRepository universityRepository) {
        this.universityRepository = universityRepository;
    }

    public void deleteUserFromUniversity(User user) {
        University university = user.getUniversity();
        Set<User> users = university.getStudents();
        users.remove(user);
        university.getStudents().clear();
        university.setStudents(users);
    }

    public List<University> findAll() {
        return universityRepository.findAll();
    }
}