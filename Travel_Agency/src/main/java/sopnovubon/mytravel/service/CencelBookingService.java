
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InCencelBookingDAo;
import sopnovubon.mytravel.domain.CencelBooking;

@Service
public class CencelBookingService implements InCencelBookingService{
 @Autowired 
 private InCencelBookingDAo inCencelBookingDAo;

    @Override
    public List<CencelBooking> getAllCencellation() {
        return inCencelBookingDAo.getAllCencellation();
    }

    @Override
    public CencelBooking getCencellationNo(int cencellationNo) {
        CencelBooking cencelBooking = inCencelBookingDAo.getCencellationNo(cencellationNo);
        return cencelBooking;
    }

    @Override
    public void addCencellation(CencelBooking cencelBooking) {
       inCencelBookingDAo.addCencellation(cencelBooking);
    }

    @Override
    public void updateCencellation(CencelBooking cencelBooking) {
        inCencelBookingDAo.updateCencellation(cencelBooking);
    }

    @Override
    public void deleteCencellation(int cencellationNo) {
        inCencelBookingDAo.deleteCencellation(cencellationNo);
    }
 
}
