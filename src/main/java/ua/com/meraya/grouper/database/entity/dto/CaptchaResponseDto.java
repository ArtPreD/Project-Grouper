package ua.com.meraya.grouper.database.entity.dto;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CaptchaResponseDto {
    @Setter @Getter private boolean success;

    @JsonAlias("error-codes")
    @Setter @Getter private Set<String> errorCodes;
}