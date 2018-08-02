
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.ConfirmHotelReservation;


public interface InConfrmHotelReservationDAo {
    List<ConfirmHotelReservation> getAllConfirmedHotel();

    ConfirmHotelReservation getConfirmedHotelNo(int ConfirmedHotelNo);

    void addConfirmedHotel(ConfirmHotelReservation confirmHotelReservation);

    void updateConfirmedHotel(ConfirmHotelReservation confirmHotelReservation);

    void deleteConfirmedHotel(int ConfirmedHotelNo);
}
