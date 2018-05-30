package ua.com.meraya.grouper.database.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Setter @Getter private Long id;

    @NotBlank(message = "Пожалуйста, заполните поле")
    @Length(max = 2048, message = "Сообщение слишком длинное")
    @Setter @Getter private String text;

    @NotBlank(message = "Пожалуйста, заполните поле")
    @Length(max = 20, message = "Тэг слишком длинный. Максимум 20 символов")
    @Setter @Getter private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    @Setter @Getter private User author;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "group_id")
    @Setter @Getter private Group group;

    @Setter @Getter private String filename;

    @SuppressWarnings("UnusedDeclaration")
    public Message() {
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    public Message(String message, String tag, User user, Group group) {
        this.text = message;
        this.tag = tag;
        this.author = user;
        this.group = group;
    }
}
