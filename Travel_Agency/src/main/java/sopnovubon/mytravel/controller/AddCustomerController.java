
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
import org.springframework.web.util.UriComponentsBuilder;
import sopnovubon.mytravel.domain.AdminRegistration;
import sopnovubon.mytravel.domain.CustomerRegistration;
import sopnovubon.mytravel.service.InAddCustomerService;

@Controller
@RequestMapping("/customers")
public class AddCustomerController {
    @Autowired
    private InAddCustomerService inAddCustomerService;
    
    @RequestMapping("/home")
    public String home(){
    return "customerRegistration";
    }
//    @RequestMapping(value = "/customerRegistration /{id}", method = RequestMethod.GET)
//    public ResponseEntity<CustomerRegistration> getCustomerById(@PathVariable("id") Integer id){
//    CustomerRegistration customerRegistration = inAddCustomerService.getCustomerNo(id);
//    return  new ResponseEntity<CustomerRegistration>(customerRegistration, HttpStatus.OK);
//    }
    @RequestMapping(value = "/customerRegistration/{id}", method = RequestMethod.GET)
    public ResponseEntity<CustomerRegistration> getCustomerById(@PathVariable("id") Integer id) {
        CustomerRegistration customerRegistration = inAddCustomerService.getCustomerNo(id);
        return new ResponseEntity<CustomerRegistration>(customerRegistration, HttpStatus.OK);
    }
    
    
    @RequestMapping(value = "/customerRegistration", method = RequestMethod.GET)
    public ResponseEntity<List<CustomerRegistration>> getAllCustomer(){
    List<CustomerRegistration> list = inAddCustomerService.getAllCustomer();
    return new ResponseEntity<List<CustomerRegistration>>(list, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/customerRegistration", method = RequestMethod.POST)
    public ResponseEntity<Void> addCustomer(@RequestBody CustomerRegistration customerRegistration, UriComponentsBuilder builder) {
        boolean flag = inAddCustomerService.addCustomer(customerRegistration);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/customerRegistration/{id}").buildAndExpand(customerRegistration.getCustId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
//    @RequestMapping(value = "/adminRegistration", method = RequestMethod.POST)
//    public ResponseEntity<Void> addAdmin(@RequestBody AdminRegistration adminRegistration, UriComponentsBuilder builder) {
//        boolean flag = inAddAdminService.addAdmin(adminRegistration);
//        if (flag == false) {
//            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//        }
//        HttpHeaders headers = new HttpHeaders();
//        headers.setLocation(builder.path("/adminRegistration/{id}").buildAndExpand(adminRegistration.getAdminId()).toUri());
//        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
//    }
    
    @RequestMapping(value = "/customerRegistration/{id}", method = RequestMethod.PUT)
    public ResponseEntity<CustomerRegistration> updateCustomer(@RequestBody CustomerRegistration customerRegistration) {
        inAddCustomerService.updateCustomer(customerRegistration);
        return new ResponseEntity<CustomerRegistration>(customerRegistration, HttpStatus.OK);
    }
    @RequestMapping(value = "/customerRegistration/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteCustomer(@PathVariable("id") Integer id) {
        inAddCustomerService.deleteCustomer(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
    
}
