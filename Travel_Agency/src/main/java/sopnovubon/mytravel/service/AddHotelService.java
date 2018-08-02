
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InAddHotelDao;
import sopnovubon.mytravel.domain.HotelReservation;

@Service
public class AddHotelService implements InAddHotelService{
      @Autowired
      private InAddHotelDao inAddHotelDao;

    @Override
    public List<HotelReservation> getAllHotel() {
        return inAddHotelDao.getAllHotel();
    }

    @Override
    public HotelReservation getHotelNo(int hotelNo) {
       HotelReservation hotelReservation = inAddHotelDao.getHotelNo(hotelNo);
       return hotelReservation;
    }

    @Override
    public boolean addHotel(HotelReservation hotelReservation) {
       if(inAddHotelDao.hotelExists(hotelReservation.getHotelName())){
        return false;
        }
        else{
        inAddHotelDao.addHotel(hotelReservation);
        return true;
        }
    }

    @Override
    public void updateHotel(HotelReservation hotelReservation) {
        inAddHotelDao.updateHotel(hotelReservation);
    }

    @Override
    public void deleteHotel(int hotelNo) {
        inAddHotelDao.deleteHotel(hotelNo);
    }
}
