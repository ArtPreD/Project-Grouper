package ua.com.meraya.grouper.database.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import ua.com.meraya.grouper.database.entity.enums.UserRole;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "users")
public class User implements UserDetails, Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    @Setter @Getter private Long id;

    @Column(name = "first_name")
    @NotBlank(message = "Имя не может быть пустым")
    @Setter @Getter private String first_name;

    @Column(name = "last_name")
    @NotBlank(message = "Фамилия не может быть пустым")
    @Setter @Getter private String last_name;

    @Column(name = "address")
    @Setter @Getter private String address;

    @Column(name = "email")
    @Email(message = "Неправильный формат e-mail")
    @NotBlank(message = "E-mail не может быть пустым")
    @Setter @Getter private String email;

    @Column(name = "activation_code")
    @Setter @Getter private String activationCode;

    @Column(name = "password")
    @NotBlank(message = "Пароль не может быть пустым")
    @Setter @Getter private String password;

    @Column(name = "username")
    @NotBlank(message = "Имя пользователя не может быть пустым")
    @Setter @Getter private String username;

    @Column(name = "phone")
    @Setter @Getter private String phone;

    @ElementCollection(targetClass = UserRole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    @Setter @Getter Set<UserRole> roles;

    @Column(name = "active")
    @Setter @Getter boolean isActive;

    @Column(name = "teacher")
    @Setter @Getter
    private boolean isBound;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "group_id")
    @Setter @Getter Group group;

    @OneToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE})
    @JoinColumn(name = "university_id")
    @Setter @Getter University university;

    @SuppressWarnings("UnusedDeclaration")
    public User() {
    }

    public User(String first_name, String last_name, String username,
                String email, String password) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public boolean isSuperuser(){
        return roles.contains(UserRole.SUPERUSER);
    }

    public boolean isTeacher(){
        return roles.contains(UserRole.TEACHER);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive;
    }
}
