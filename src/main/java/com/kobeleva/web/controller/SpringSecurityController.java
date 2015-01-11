package com.kobeleva.web.controller;

import com.kobeleva.config.core.MongoConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringSecurityController {

    @RequestMapping(value = { "/", "/home**" }, method = RequestMethod.GET)
    public ModelAndView homePage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Курсовой проект - Разработка системы автоматизации работы лесного хозяйства.");
        model.addObject("message", "Выполнила Кобелева Алеся");
        model.setViewName("home");
        return model;
    }

    @RequestMapping(value = { "/master**" }, method = RequestMethod.GET)
    public ModelAndView masterPage() {

        ModelAndView model = new ModelAndView();
        model.setViewName("master");
        return model;
    }

    @RequestMapping(value = "/profile**", method = RequestMethod.GET)
    public ModelAndView profilePage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Профиль пользователя");
        model.addObject("message", "Страница доступна только зарегистрированным пользователям.");
        model.setViewName("profile");

        return model;
    }

    //Spring Security see this :
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username or password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;

    }
}