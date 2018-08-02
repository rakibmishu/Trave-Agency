
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.HotelReservation;


public interface InAddHotelService {
     List<HotelReservation> getAllHotel();

    HotelReservation getHotelNo(int hotelNo);

    boolean addHotel(HotelReservation hotelReservation);

    void updateHotel(HotelReservation hotelReservation);

    void deleteHotel(int hotelNo);
}
