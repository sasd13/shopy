/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sasd13.shopy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Samir
 */
@Controller
public class LoginController {
    
    private static final String VIEW_LOGIN = "login";
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String render(Model model) {
        
        return VIEW_LOGIN;
    }
}
