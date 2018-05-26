package ua.com.meraya.grouper.database.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "universities")
public class University implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Setter @Getter private Long id;

    @Column(name = "name")
    @Setter @Getter private String name;

    @Column(name = "abbreviation")
    @Setter @Getter private String abbreviation;

    @Column(name = "address")
    @Setter @Getter private String address;

    @ElementCollection(targetClass = User.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "university_students", joinColumns = @JoinColumn(name = "university_id"))
    @Setter @Getter private Set<User> students;

    @ElementCollection(targetClass = Group.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "university_groups", joinColumns = @JoinColumn(name = "university_id"))
    @Setter @Getter private Set<Group> groups;
}
