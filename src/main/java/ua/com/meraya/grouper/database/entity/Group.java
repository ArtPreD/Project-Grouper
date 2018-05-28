package ua.com.meraya.grouper.database.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "groups")
public class Group implements Serializable {


    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Setter @Getter private Long id;

    @Column(name = "name")
    @Setter @Getter private String name;

    @Column(name = "direction")
    @Setter @Getter private String direction;

    @Column(name = "abbreviation")
    @Setter @Getter private String abbreviation;

    @Column(name = "places")
    @Setter @Getter private int places;

    @Column(name = "messages")
    @Setter @Getter private int messages;

    @Column(name = "stat_count")
    @Setter @Getter private int stat;

    @ElementCollection(targetClass = User.class, fetch = FetchType.LAZY)
    @CollectionTable(name = "groups_students", joinColumns = @JoinColumn(name = "group_id"))
    @Setter @Getter private Set<User> students;

    @ElementCollection(targetClass = User.class, fetch = FetchType.LAZY)
    @CollectionTable(name = "groups_statements", joinColumns = @JoinColumn(name = "group_id"))
    @Setter @Getter private Set<User> statements;

//    @ElementCollection(targetClass = Discipline.class, fetch = FetchType.EAGER)
//    @CollectionTable(name = "groups_disciplines", joinColumns = @JoinColumn(name = "discipline_id"))
//    @Setter @Getter private List<Discipline> disciplines;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "university_id", nullable = false)
    @Setter @Getter private University university;

    @OneToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE})
    @JoinColumn(name = "teacher_id")
    @Setter @Getter User teacher;

    @SuppressWarnings("UnusedDeclaration")
    public Group() {
    }

    public Group(String name, String abbreviation, User teacher, University university) {
        this.name = name;
        this.direction = "direction";
        this.abbreviation = abbreviation;
        this.places = 40;
        this.teacher = teacher;
        this.university = university;
        this.messages = 0;
        this.stat = 0;
    }
}
