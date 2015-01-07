package com.kobeleva.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/profile**", method = RequestMethod.GET)
    public ModelAndView profilePage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Профиль пользователя");
        model.addObject("message", "Страница доступна только зарегистрированным пользователям.");
        model.setViewName("profile");

        return model;
    }
}