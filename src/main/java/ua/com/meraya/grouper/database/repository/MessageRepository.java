package ua.com.meraya.grouper.database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import ua.com.meraya.grouper.database.entity.Group;
import ua.com.meraya.grouper.database.entity.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findByTagAndGroup(String tag, Group group);
    List<Message> findByGroup(Group group);
}
