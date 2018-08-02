
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.HotelReservation;

@Transactional
@Repository
public class AddHotelDao implements InAddHotelDao{
      @Autowired
       private HibernateTemplate hibernateTemplate;

    @Override
    public List<HotelReservation> getAllHotel() {
       String hql = " From HotelReservation as hr ORDER BY hr.hotelId";
        return(List < HotelReservation >) hibernateTemplate.find(hql);
    }

    @Override
    public HotelReservation getHotelNo(int hotelNo) {
        return hibernateTemplate.get(HotelReservation.class, hotelNo);
    }

    @Override
    public void addHotel(HotelReservation hotelReservation) {
        hibernateTemplate.save(hotelReservation);
    }

    @Override
    public void updateHotel(HotelReservation hotelReservation) {
       HotelReservation hr =getHotelNo(hotelReservation.getHotelId());
       hr.setHotelPlace(hotelReservation.getHotelPlace());
       hr.setHotelName(hotelReservation.getHotelName());
       hr.setRoomTypeCost(hotelReservation.getRoomTypeCost());
       hr.setFacilitiesCost(hotelReservation.getFacilitiesCost());
       hr.setAvailableRoom(hotelReservation.getAvailableRoom());
       hibernateTemplate.update(hr);
    }

    @Override
    public void deleteHotel(int hotelNo) {
        hibernateTemplate.delete(getHotelNo(hotelNo));
    }

    @Override
    public boolean hotelExists(String name) {
       String hql = "FROM HotelReservation as hr WHERE hr.hotelName=?";
        List<HotelReservation> hrlist = (List<HotelReservation>) hibernateTemplate.find(hql, name);
        return hrlist.size()>0 ? true:false;
    }
      
}
