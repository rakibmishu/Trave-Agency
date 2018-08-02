package sopnovubon.mytravel.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.util.UriComponentsBuilder;
import sopnovubon.mytravel.domain.AdminRegistration;
import sopnovubon.mytravel.service.InAddAdminService;

@Controller
@RequestMapping("/admins")
public class AddAdminController {

    @Autowired
    private InAddAdminService inAddAdminService;

    @RequestMapping("/home")
    public String home() {
        return "adminRegistration";
    }

    @RequestMapping(value = "/adminRegistration/{id}", method = RequestMethod.GET)
    public ResponseEntity<AdminRegistration> getAdminById(@PathVariable("id") Integer id) {
        AdminRegistration adminRegistration = inAddAdminService.getAdminNo(id);
        return new ResponseEntity<AdminRegistration>(adminRegistration, HttpStatus.OK);
    }

    @RequestMapping(value = "/adminRegistration", method = RequestMethod.GET)
    public ResponseEntity<List<AdminRegistration>> getAllAdmin() {
        List<AdminRegistration> list = inAddAdminService.getAllAdmin();
        return new ResponseEntity<List<AdminRegistration>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/adminRegistration", method = RequestMethod.POST)
    public ResponseEntity<Void> addAdmin(@RequestBody AdminRegistration adminRegistration, UriComponentsBuilder builder) {
        boolean flag = inAddAdminService.addAdmin(adminRegistration);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/adminRegistration/{id}").buildAndExpand(adminRegistration.getAdminId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

   @RequestMapping(value = "/adminRegistration/{id}", method = RequestMethod.PUT)
    public ResponseEntity<AdminRegistration> updateAdmin(@RequestBody AdminRegistration adminRegistration) {
        inAddAdminService.updateAdmin(adminRegistration);
        return new ResponseEntity<AdminRegistration>(adminRegistration, HttpStatus.OK);
    }
    
@RequestMapping(value = "/adminRegistration/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteAdmin(@PathVariable("id") Integer id) {
        inAddAdminService.deleteAdmin(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }

}
   
    
   

//@RequestMapping(value = "/tsplist/{id}", method = RequestMethod.DELETE)
//    public ResponseEntity<Void> deleteTsp(@PathVariable("id") Integer id) {
//        iTspInfoService.deleteTsp(id);
//        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
//    }
