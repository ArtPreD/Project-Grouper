package ua.com.meraya.grouper.database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.meraya.grouper.database.entity.Group;
import ua.com.meraya.grouper.database.entity.University;


public interface GroupRepository extends JpaRepository<Group, Long> {
    Group findByName(String name);
    Group findByAbbreviationAndName(String abbreviation, String name);
    Group findByNameAndUniversity(String name, University university);
}
