
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.ConfirmBooking;


public interface InConfirmBookingDao {
    List<ConfirmBooking> getAllBooking();

    ConfirmBooking getBookingNo(int bookingNo);

    void addBooking(ConfirmBooking confirmBooking);

    void updateBooking(ConfirmBooking confirmBooking);

    void deleteBooking(int bookingNo);
}
