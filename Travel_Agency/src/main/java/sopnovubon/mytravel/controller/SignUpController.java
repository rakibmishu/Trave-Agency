
package sopnovubon.mytravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/signup")
public class SignUpController {
    
    @RequestMapping("/home")
    public String home() {
        return "signUp";
    }
}
