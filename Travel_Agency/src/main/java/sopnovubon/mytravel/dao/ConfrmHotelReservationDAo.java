
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.ConfirmHotelReservation;

@Transactional
@Repository
public class ConfrmHotelReservationDAo implements InConfrmHotelReservationDAo{
     @Autowired
      private HibernateTemplate hibernateTemplate;

    @Override
    public List<ConfirmHotelReservation> getAllConfirmedHotel() {
       String hql = "From ConfirmHotelReservation chr LEFT JOIN FETCH chr.customerRegistration LEFT JOIN FETCH chr.hotelReservation ORDER BY chr.hotelReservationId";
       return (List<ConfirmHotelReservation>) hibernateTemplate.find(hql);
    }

    @Override
    public ConfirmHotelReservation getConfirmedHotelNo(int ConfirmedHotelNo) {
       return hibernateTemplate.get(ConfirmHotelReservation.class, ConfirmedHotelNo);
    }

    @Override
    public void addConfirmedHotel(ConfirmHotelReservation confirmHotelReservation) {
        hibernateTemplate.save(confirmHotelReservation);
    }

    @Override
    public void updateConfirmedHotel(ConfirmHotelReservation confirmHotelReservation) {
       ConfirmHotelReservation chr = getConfirmedHotelNo(confirmHotelReservation.getHotelReservationId());
       chr.setCustomerRegistration(confirmHotelReservation.getCustomerRegistration());
       chr.setHotelReservation(confirmHotelReservation.getHotelReservation());
       chr.setReservationDate(confirmHotelReservation.getReservationDate());
       chr.setCheckIn(confirmHotelReservation.getCheckIn());
       chr.setCheckOut(confirmHotelReservation.getCheckOut());
       hibernateTemplate.update(chr);
    }

    @Override
    public void deleteConfirmedHotel(int ConfirmedHotelNo) {
       hibernateTemplate.delete(getConfirmedHotelNo(ConfirmedHotelNo));
    }
     
     
}
