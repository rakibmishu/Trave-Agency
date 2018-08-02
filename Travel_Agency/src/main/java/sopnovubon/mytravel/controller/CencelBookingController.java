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
import sopnovubon.mytravel.domain.ConfirmBooking;
import sopnovubon.mytravel.service.InCencelBookingService;

@Controller
@RequestMapping("/cencel")
public class CencelBookingController {

    @Autowired
    private InCencelBookingService inCencelBookingService;

    @RequestMapping("/home")
    public String Home() {
        return "cencelBooking";
    }

    @RequestMapping(value = "/cencelBooking", method = RequestMethod.GET)
    public ResponseEntity<List<CencelBooking>> getAllCencellation() {
        List<CencelBooking> list = inCencelBookingService.getAllCencellation();
        return new ResponseEntity<List<CencelBooking>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/cencelBooking/{id}", method = RequestMethod.GET)
    public ResponseEntity<CencelBooking> getCencellationById(@PathVariable("id") Integer id) {
        CencelBooking cencelBooking = inCencelBookingService.getCencellationNo(id);
        return new ResponseEntity<CencelBooking>(cencelBooking, HttpStatus.OK);
    }

    @RequestMapping(value = "/cencelBooking", method = RequestMethod.POST)
    public ResponseEntity<Void> addCencellation(@RequestBody CencelBooking cencelBooking, UriComponentsBuilder builder) {
        inCencelBookingService.addCencellation(cencelBooking);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/cencelBooking/{id}").buildAndExpand(cencelBooking.getCencelBookingId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/cencelBooking/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteCencellation(@PathVariable("id") Integer id) {
        inCencelBookingService.deleteCencellation(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
    @RequestMapping(value = "/cencelBooking/{id}", method = RequestMethod.PUT)
    public ResponseEntity<CencelBooking> updateCencellation(@RequestBody CencelBooking cencelBooking) {
        inCencelBookingService.updateCencellation(cencelBooking);
        return new ResponseEntity<CencelBooking>(cencelBooking, HttpStatus.OK);
    }
    
}
