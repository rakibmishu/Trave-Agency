
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.ConfirmHotelReservation;


public interface InConfrmHotelReservationService {
    List<ConfirmHotelReservation> getAllConfirmedHotel();

    ConfirmHotelReservation getConfirmedHotelNo(int ConfirmedHotelNo);

    void addConfirmedHotel(ConfirmHotelReservation confirmHotelReservation);

    void updateConfirmedHotel(ConfirmHotelReservation confirmHotelReservation);

    void deleteConfirmedHotel(int ConfirmedHotelNo);
}
