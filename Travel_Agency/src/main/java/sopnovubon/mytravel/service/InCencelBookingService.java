
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.CencelBooking;

public interface InCencelBookingService {
     List<CencelBooking> getAllCencellation();

    CencelBooking getCencellationNo(int cencellationNo);

    void addCencellation(CencelBooking cencelBooking);

    void updateCencellation(CencelBooking cencelBooking);

    void deleteCencellation(int cencellationNo);
}
