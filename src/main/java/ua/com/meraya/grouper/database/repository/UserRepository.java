package ua.com.meraya.grouper.database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.meraya.grouper.database.entity.User;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByActivationCode(String code);
}
