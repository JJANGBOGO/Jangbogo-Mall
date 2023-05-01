package com.jangbogo.mall.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
@Slf4j
public class ErrHandler {
    // 404처리
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle404(NoHandlerFoundException e){
        e.printStackTrace();
        log.info("......error 404......"); //왜 얘만 안됨??
        return "/error/404";
    }

    //404 제외 오류는 500으로 처리
    @ExceptionHandler(Exception.class) //ok
    public String handleException(Exception e) {
        e.printStackTrace();
        return "/error/500";
    }

}
