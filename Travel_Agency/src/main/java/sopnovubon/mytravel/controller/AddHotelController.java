
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
import sopnovubon.mytravel.domain.HotelReservation;
import sopnovubon.mytravel.service.InAddHotelService;

@Controller
@RequestMapping("/hotels")
public class AddHotelController {
    @Autowired
    private InAddHotelService inAddHotelService;
    
    @RequestMapping("/home")
    public String home() {
        return "hotelReservation";
    }
    @RequestMapping(value = "/hotelReservation/{id}", method = RequestMethod.GET)
    public ResponseEntity<HotelReservation> getHotelById(@PathVariable("id") Integer id) {
        HotelReservation hotelReservation = inAddHotelService.getHotelNo(id);
        return new ResponseEntity<HotelReservation>(hotelReservation, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/hotelReservation", method = RequestMethod.GET)
    public ResponseEntity<List<HotelReservation>> getAllHotel() {
        List<HotelReservation> list = inAddHotelService.getAllHotel();
        return new ResponseEntity<List<HotelReservation>>(list, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/hotelReservation", method = RequestMethod.POST)
    public ResponseEntity<Void> addHotel(@RequestBody HotelReservation hotelReservation, UriComponentsBuilder builder) {
        boolean flag = inAddHotelService.addHotel(hotelReservation);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/hotelReservation/{id}").buildAndExpand(hotelReservation.getHotelId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    } 
    @RequestMapping(value = "/hotelReservation/{id}", method = RequestMethod.PUT)
    public ResponseEntity<HotelReservation> updateHotel(@RequestBody HotelReservation hotelReservation) {
        inAddHotelService.updateHotel(hotelReservation);
        return new ResponseEntity<HotelReservation>(hotelReservation, HttpStatus.OK);   
    }
   @RequestMapping(value = "/hotelReservation/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteHotel(@PathVariable("id") Integer id) {
        inAddHotelService.deleteHotel(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
}
}
