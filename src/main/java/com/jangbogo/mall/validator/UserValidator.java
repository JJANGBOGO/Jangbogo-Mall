package com.jangbogo.mall.validator;


import com.jangbogo.mall.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object obj, Errors error) {
        ValidationUtils.rejectIfEmptyOrWhitespace(error, "id", "user.id.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(error, "pwd", "user.pwd.empty");
    }

}
