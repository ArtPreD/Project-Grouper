package ua.com.meraya.grouper.database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.meraya.grouper.database.entity.Group;

public interface GroupRepository extends JpaRepository<Group, Long> {
    Group findByName(String name);
    Group findByAbbreviationAndName(String abbreviation, String name);
}
