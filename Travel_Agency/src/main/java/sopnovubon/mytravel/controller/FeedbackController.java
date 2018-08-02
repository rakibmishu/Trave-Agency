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
import sopnovubon.mytravel.domain.CustomerFeedback;
import sopnovubon.mytravel.domain.PaymentSystem;
import sopnovubon.mytravel.service.InFeedbackService;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

    @Autowired
    private InFeedbackService inFeedbackService;

    @RequestMapping("/home")
    public String Home() {
        return "customerFeedback";
    }

    @RequestMapping(value = "/customerFeedback", method = RequestMethod.GET)
    public ResponseEntity<List<CustomerFeedback>> getAllFeedback() {
        List<CustomerFeedback> list = inFeedbackService.getAllFeedback();
        return new ResponseEntity<List<CustomerFeedback>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/customerFeedback/{id}", method = RequestMethod.GET)
    public ResponseEntity<CustomerFeedback> getFeedbackById(@PathVariable("id") Integer id) {
        CustomerFeedback customerFeedback = inFeedbackService.getFeedbackNo(id);
        return new ResponseEntity<CustomerFeedback>(customerFeedback, HttpStatus.OK);
    }

    @RequestMapping(value = "/customerFeedback", method = RequestMethod.POST)
    public ResponseEntity<Void> addFeedback(@RequestBody CustomerFeedback customerFeedback, UriComponentsBuilder builder) {
        inFeedbackService.addFeedback(customerFeedback);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/customerFeedback/{id}").buildAndExpand(customerFeedback.getFeedbackId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/customerFeedback/{id}", method = RequestMethod.PUT)
    public ResponseEntity<CustomerFeedback> updateFeedback(@RequestBody CustomerFeedback customerFeedback) {
        inFeedbackService.updateFeedback(customerFeedback);
        return new ResponseEntity<CustomerFeedback>(customerFeedback, HttpStatus.OK);
    }

    @RequestMapping(value = "/customerFeedback/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteFeedback(@PathVariable("id") Integer id) {
        inFeedbackService.deleteFeedback(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
