package ua.com.meraya.grouper.database.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ua.com.meraya.grouper.database.entity.University;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.entity.enums.UserRole;
import ua.com.meraya.grouper.database.repository.UniversityRepository;
import ua.com.meraya.grouper.database.repository.UserRepository;
import ua.com.meraya.grouper.database.service.mailsender.MailSender;
import ua.com.meraya.grouper.database.service.mailsender.MessageGenerator;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService{

    private final UserRepository userRepository;
    private final UniversityRepository universityRepository;
    private final MailSender mailSender;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, UniversityRepository universityRepository,
                       MailSender mailSender, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.universityRepository = universityRepository;
        this.mailSender = mailSender;
        this.passwordEncoder = passwordEncoder;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null){
            throw new UsernameNotFoundException("Пользователь с таким ником не найден.");
        }

        return user;
    }

    public boolean addUser(User user){
        User userFromDb = userRepository.findByUsername(user.getUsername());

        if(userFromDb != null){
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(UserRole.STUDENT));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);

        sendMessage(user);

        return true;
    }

    private void sendMessage(User user) {
            mailSender.send(user.getEmail(), "Activation Grouper account",
                    MessageGenerator.registrationMessage(user));
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if(user == null){
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);
        userRepository.save(user);

        return true;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(UserRole.values()).map(UserRole::name).collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(UserRole.valueOf(key));
            }
        }
        userRepository.saveAndFlush(user);
    }

    public void updateUser(User user){
        userRepository.save(user);
    }

    public void updateProfile(User user, String password, String email, String university) {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));
        if (isEmailChanged){
            user.setEmail(email);

            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if(!StringUtils.isEmpty(password)){
            user.setPassword(password);
        }

        if(!university.equals("Выбери...")){
            University u = universityRepository.findByName(university);
            user.setUniversity(u);
            u.getStudents().add(user);
            universityRepository.save(u);
        }

        userRepository.save(user);

        if(isEmailChanged) {
            sendMessage(user);
        }
    }
}
