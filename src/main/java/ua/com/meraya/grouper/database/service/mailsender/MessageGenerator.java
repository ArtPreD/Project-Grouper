package ua.com.meraya.grouper.database.service.mailsender;

import org.springframework.util.StringUtils;
import ua.com.meraya.grouper.database.entity.User;

public class MessageGenerator {

    public static String registrationMessage(User user) {
        String message = "";
        if (!StringUtils.isEmpty(user.getEmail())) {
            message = String.format(
                    "Hello, %s %s! \n" +
                            "Welcome to Grouper! Please, click the link to activate your account: " +
                            "http://localhost:8080/activate/%s",
                    user.getLast_name(),
                    user.getFirst_name(),
                    user.getActivationCode()
            );
        }
        return message;
    }
}
