
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.ConfirmBooking;
import sopnovubon.mytravel.domain.PackageSubCategory;

@Transactional
@Repository
public class ConfirmBookingDao implements InConfirmBookingDao{
 @Autowired
 private HibernateTemplate hibernateTemplate;

    @Override
    public List<ConfirmBooking> getAllBooking() {
      // String hql = "From ConfirmBooking cb LEFT JOIN FETCH cb.confirmBooking ORDER BY cb.bookingId";
        String hql = "From ConfirmBooking cb LEFT JOIN FETCH cb.customerRegistration LEFT JOIN FETCH cb.pack ORDER BY cb.bookingId";
       return (List<ConfirmBooking>) hibernateTemplate.find(hql);
    }

    @Override
    public ConfirmBooking getBookingNo(int bookingNo) {
        return hibernateTemplate.get(ConfirmBooking.class , bookingNo);
    }

    @Override
    public void addBooking(ConfirmBooking confirmBooking) {
       hibernateTemplate.save(confirmBooking);
    }

    @Override
    public void updateBooking(ConfirmBooking confirmBooking) {
      ConfirmBooking cb = getBookingNo(confirmBooking.getBookingId());
      cb.setPack(confirmBooking.getPack());
      cb.setCustomerRegistration(confirmBooking.getCustomerRegistration());
      cb.setConfirmDate(confirmBooking.getConfirmDate());
      hibernateTemplate.update(cb);
      }

    @Override
    public void deleteBooking(int bookingNo) {
       hibernateTemplate.delete(getBookingNo(bookingNo));
    }
 
}
