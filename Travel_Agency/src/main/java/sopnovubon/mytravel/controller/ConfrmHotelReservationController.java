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
import sopnovubon.mytravel.domain.ConfirmHotelReservation;
import sopnovubon.mytravel.domain.CustomerFeedback;
import sopnovubon.mytravel.service.InConfrmHotelReservationService;

@Controller
@RequestMapping("/confirm")
public class ConfrmHotelReservationController {

    @Autowired
    private InConfrmHotelReservationService inConfrmHotelReservationService;

    @RequestMapping("/home")
    public String Home() {
        return "confirmHotelReservation";
    }

    @RequestMapping(value = "/confirmHotelReservation", method = RequestMethod.GET)
    public ResponseEntity<List<ConfirmHotelReservation>> getAllReservation() {
        List<ConfirmHotelReservation> list = inConfrmHotelReservationService.getAllConfirmedHotel();
        return new ResponseEntity<List<ConfirmHotelReservation>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/confirmHotelReservation/{id}", method = RequestMethod.GET)
    public ResponseEntity<ConfirmHotelReservation> getReservationById(@PathVariable("id") Integer id) {
        ConfirmHotelReservation confirmHotelReservation = inConfrmHotelReservationService.getConfirmedHotelNo(id);
        return new ResponseEntity<ConfirmHotelReservation>(confirmHotelReservation, HttpStatus.OK);
    }

    @RequestMapping(value = "/confirmHotelReservation", method = RequestMethod.POST)
    public ResponseEntity<Void> addConfirmedHotel(@RequestBody ConfirmHotelReservation confirmHotelReservation, UriComponentsBuilder builder) {
        inConfrmHotelReservationService.addConfirmedHotel(confirmHotelReservation);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/confirmHotelReservation/{id}").buildAndExpand(confirmHotelReservation.getHotelReservationId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
@RequestMapping(value = "/confirmHotelReservation/{id}", method = RequestMethod.PUT)
    public ResponseEntity<ConfirmHotelReservation> updateConfirmedHotel(@RequestBody ConfirmHotelReservation confirmHotelReservation) {
        inConfrmHotelReservationService.updateConfirmedHotel(confirmHotelReservation);
        return new ResponseEntity<ConfirmHotelReservation>(confirmHotelReservation, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/confirmHotelReservation/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteConfirmedHotel(@PathVariable("id") Integer id) {
        inConfrmHotelReservationService.deleteConfirmedHotel(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
