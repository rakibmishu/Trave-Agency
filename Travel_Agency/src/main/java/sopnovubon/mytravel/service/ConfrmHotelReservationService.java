
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InConfrmHotelReservationDAo;
import sopnovubon.mytravel.domain.ConfirmHotelReservation;

@Service
public class ConfrmHotelReservationService implements InConfrmHotelReservationService {
    @Autowired
    private InConfrmHotelReservationDAo inConfrmHotelReservationDAo;

    @Override
    public List<ConfirmHotelReservation> getAllConfirmedHotel() {
       return inConfrmHotelReservationDAo.getAllConfirmedHotel();
    }

    @Override
    public ConfirmHotelReservation getConfirmedHotelNo(int ConfirmedHotelNo) {
       ConfirmHotelReservation confirmHotelReservation = inConfrmHotelReservationDAo.getConfirmedHotelNo(ConfirmedHotelNo);
       return confirmHotelReservation;
    }

    @Override
    public void addConfirmedHotel(ConfirmHotelReservation confirmHotelReservation) {
       inConfrmHotelReservationDAo.addConfirmedHotel(confirmHotelReservation);
    }

    @Override
    public void updateConfirmedHotel(ConfirmHotelReservation confirmHotelReservation) {
       inConfrmHotelReservationDAo.updateConfirmedHotel(confirmHotelReservation);
    }

    @Override
    public void deleteConfirmedHotel(int ConfirmedHotelNo) {
       inConfrmHotelReservationDAo.deleteConfirmedHotel(ConfirmedHotelNo);
    }
    
}
