
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.CencelBooking;


public interface InCencelBookingDAo {
    List<CencelBooking> getAllCencellation();

    CencelBooking getCencellationNo(int cencellationNo);

    void addCencellation(CencelBooking cencelBooking);

    void updateCencellation(CencelBooking cencelBooking);

    void deleteCencellation(int cencellationNo);
}
