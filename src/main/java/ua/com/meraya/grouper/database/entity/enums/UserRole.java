package ua.com.meraya.grouper.database.entity.enums;

import org.springframework.security.core.GrantedAuthority;

public enum UserRole implements GrantedAuthority {
    STUDENT, TEACHER, SUPERUSER;

    @Override
    public String getAuthority() {
        return name();
    }
}
