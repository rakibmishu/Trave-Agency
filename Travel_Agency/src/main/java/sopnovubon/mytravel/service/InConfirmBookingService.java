package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.ConfirmBooking;

public interface InConfirmBookingService {

    List<ConfirmBooking> getAllBooking();

    ConfirmBooking getBookingNo(int bookingNo);

    void addBooking(ConfirmBooking confirmBooking);

    void updateBooking(ConfirmBooking confirmBooking);

    void deleteBooking(int bookingNo);
}
