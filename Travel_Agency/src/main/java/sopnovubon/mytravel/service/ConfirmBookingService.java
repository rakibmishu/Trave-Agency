
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InConfirmBookingDao;
import sopnovubon.mytravel.domain.ConfirmBooking;

@Service
public class ConfirmBookingService implements InConfirmBookingService{
   @Autowired
   private InConfirmBookingDao inConfirmBookingDao;

    @Override
    public List<ConfirmBooking> getAllBooking() {
       return inConfirmBookingDao.getAllBooking();
    }

    @Override
    public ConfirmBooking getBookingNo(int bookingNo) {
        ConfirmBooking confirmBooking = inConfirmBookingDao.getBookingNo(bookingNo);
        return confirmBooking;
    }

    @Override
    public void addBooking(ConfirmBooking confirmBooking) {
        inConfirmBookingDao.addBooking(confirmBooking);
    }

    @Override
    public void updateBooking(ConfirmBooking confirmBooking) {
       inConfirmBookingDao.updateBooking(confirmBooking);
    }

    @Override
    public void deleteBooking(int bookingNo) {
       inConfirmBookingDao.deleteBooking(bookingNo);
    }
}
