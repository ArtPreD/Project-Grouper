package ua.com.meraya.grouper.database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.meraya.grouper.database.entity.University;

public interface UniversityRepository extends JpaRepository<University, Long> {
    University findByName(String name);
}
