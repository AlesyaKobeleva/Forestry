package com.kobeleva.web.controller;

import com.kobeleva.config.EngineerHandler;
import com.kobeleva.config.MasterHandler;
import com.kobeleva.config.core.MongoConfig;
import com.kobeleva.db.CuttingSection;
import com.kobeleva.db.Orders;
import com.kobeleva.db.TechMap;
import com.kobeleva.db.WoodType;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SpringSecurityController {

    private ApplicationContext ctx = new AnnotationConfigApplicationContext(MongoConfig.class);
    private MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");

    private Integer init = 0;

    @RequestMapping(value = { "/", "/home**" }, method = RequestMethod.GET)
    public ModelAndView homePage() {
        if (init == 0) {
            initDB();
        }

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Курсовой проект - Разработка системы автоматизации работы лесного хозяйства.");
        model.addObject("message", "Выполнила Кобелева Алеся");
        model.setViewName("home");
        return model;
    }

    @RequestMapping(value = { "/master" }, method = RequestMethod.GET)
    public ModelAndView masterPage() {
        if (init == 0) {
            initDB();
        }

        ModelAndView model = new ModelAndView();
        List<CuttingSection> cuttingSections = mongoOperation.findAll(CuttingSection.class);
        model.addObject("cuttingSections", cuttingSections);
        model.setViewName("master");
        return model;
    }

    @RequestMapping(value="/master", method=RequestMethod.POST)
    public String greetingSubmit(@ModelAttribute MasterHandler masterHandler, Model model) {
        model.addAttribute("title", "Добавление новой породы");
        model.addAttribute("message", "Данные успешно сохранены");

        WoodType woodType = new WoodType(masterHandler.getSpecies(), masterHandler.getCuttingSection());
        mongoOperation.save(woodType);

        return "result";
    }

    @RequestMapping(value = { "/engineer**" }, method = RequestMethod.GET)
    public ModelAndView engineerPage() {
        if (init == 0) {
            initDB();
        }

        ModelAndView model = new ModelAndView();
        List<WoodType> woodType = mongoOperation.findAll(WoodType.class);
        model.addObject("species", woodType);
        model.setViewName("engineer");

        return model;
    }

    @RequestMapping(value="/engineer", method=RequestMethod.POST)
    public String greetingSubmit(@ModelAttribute EngineerHandler engineerHandler, Model model) {
        model.addAttribute("title", "Добавление нового заказа");
        model.addAttribute("message", "Данные успешно сохранены");

        Orders orders = new Orders(engineerHandler.getWoodType(), engineerHandler.getWoodCount(), engineerHandler.getWoodLength());
        mongoOperation.save(orders);

        System.out.println("4. Number of user = " + engineerHandler.toString());

        return "result";
    }

    @RequestMapping(value = "/profile**", method = RequestMethod.GET)
    public ModelAndView profilePage() {
        if (init == 0) {
            initDB();
        }

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

    private void initDB(){
        for (int i = 0; i < 5; i++){
            CuttingSection cuttingSection = new CuttingSection("section_" + i);
            mongoOperation.save(cuttingSection);

            TechMap techMap = new TechMap("techMap_" + i);
            mongoOperation.save(techMap);
        }

        init = 1;
    }
}