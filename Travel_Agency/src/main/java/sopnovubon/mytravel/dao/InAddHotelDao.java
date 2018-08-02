
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.HotelReservation;


public interface InAddHotelDao {
     List<HotelReservation> getAllHotel();

    HotelReservation getHotelNo(int hotelNo);

    void addHotel(HotelReservation hotelReservation);

    void updateHotel(HotelReservation hotelReservation);

    void deleteHotel(int hotelNo);

    boolean hotelExists(String name);
}
