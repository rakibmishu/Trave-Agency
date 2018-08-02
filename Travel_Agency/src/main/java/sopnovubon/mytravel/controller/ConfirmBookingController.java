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
import sopnovubon.mytravel.domain.ConfirmBooking;
import sopnovubon.mytravel.domain.Pack;
import sopnovubon.mytravel.service.InConfirmBookingService;

@Controller
@RequestMapping("/booking")
public class ConfirmBookingController {

    @Autowired
    private InConfirmBookingService inConfirmBookingService;

    @RequestMapping("/home")
    public String Home() {
        return "confirmBooking";
    }

    @RequestMapping(value = "/confirmBooking", method = RequestMethod.GET)
    public ResponseEntity<List<ConfirmBooking>> getAllBooking() {
        List<ConfirmBooking> list = inConfirmBookingService.getAllBooking();
        return new ResponseEntity<List<ConfirmBooking>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/confirmBooking/{id}", method = RequestMethod.GET)
    public ResponseEntity<ConfirmBooking> getBookingById(@PathVariable("id") Integer id) {
        ConfirmBooking confirmBooking = inConfirmBookingService.getBookingNo(id);
        return new ResponseEntity<ConfirmBooking>(confirmBooking, HttpStatus.OK);
    }

    @RequestMapping(value = "/confirmBooking", method = RequestMethod.POST)
    public ResponseEntity<Void> addBooking(@RequestBody ConfirmBooking confirmBooking, UriComponentsBuilder builder) {
        inConfirmBookingService.addBooking(confirmBooking);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/confirmBooking/{id}").buildAndExpand(confirmBooking.getBookingId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

//    @RequestMapping(value = "/confirmBooking/{id}", method = RequestMethod.PUT)
//    public ResponseEntity<ConfirmBooking> updateBooking(@RequestBody ConfirmBooking confirmBooking) {
//        inConfirmBookingService.updateBooking(confirmBooking);
//        return new ResponseEntity<ConfirmBooking>(confirmBooking, HttpStatus.OK);
//    }
   @RequestMapping(value = "/confirmBooking/{id}", method = RequestMethod.PUT)
    public ResponseEntity<ConfirmBooking> updateBooking(@RequestBody ConfirmBooking confirmBooking) {
        inConfirmBookingService.updateBooking(confirmBooking);
        return new ResponseEntity<ConfirmBooking>(confirmBooking, HttpStatus.OK);
    }
    

    @RequestMapping(value = "/confirmBooking/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteBooking(@PathVariable("id") Integer id) {
        inConfirmBookingService.deleteBooking(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }

}
