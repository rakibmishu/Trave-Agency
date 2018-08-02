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
import sopnovubon.mytravel.domain.CencelBooking;
import sopnovubon.mytravel.domain.PaymentSystem;
import sopnovubon.mytravel.service.InPaymentSystemService;

@Controller
@RequestMapping("/payment")
public class PaymentSystemController {

    @Autowired
    private InPaymentSystemService inPaymentSystemService;

    @RequestMapping("/home")
    public String Home() {
        return "paymentSystem";
    }

    @RequestMapping(value = "/paymentSystem", method = RequestMethod.GET)
    public ResponseEntity<List<PaymentSystem>> getAllPayment() {
        List<PaymentSystem> list = inPaymentSystemService.getAllPayment();
        return new ResponseEntity<List<PaymentSystem>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/paymentSystem/{id}", method = RequestMethod.GET)
    public ResponseEntity<PaymentSystem> getPaymentById(@PathVariable("id") Integer id) {
        PaymentSystem paymentSystem = inPaymentSystemService.getPaymentNo(id);
        return new ResponseEntity<PaymentSystem>(paymentSystem, HttpStatus.OK);
    }

    @RequestMapping(value = "/paymentSystem", method = RequestMethod.POST)
    public ResponseEntity<Void> addPayment(@RequestBody PaymentSystem paymentSystem, UriComponentsBuilder builder) {
        inPaymentSystemService.addPayment(paymentSystem);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/paymentSystem/{id}").buildAndExpand(paymentSystem.getPaymentId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/paymentSystem/{id}", method = RequestMethod.PUT)
    public ResponseEntity<PaymentSystem> updatePayment(@RequestBody PaymentSystem paymentSystem) {
        inPaymentSystemService.updatePayment(paymentSystem);
        return new ResponseEntity<PaymentSystem>(paymentSystem, HttpStatus.OK);
    }
    @RequestMapping(value = "/paymentSystem/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deletePayment(@PathVariable("id") Integer id) {
        inPaymentSystemService.deletePayment(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
