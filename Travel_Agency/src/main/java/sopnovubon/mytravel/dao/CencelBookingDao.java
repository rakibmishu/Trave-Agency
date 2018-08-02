
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.CencelBooking;

@Transactional
@Repository
public class CencelBookingDao implements InCencelBookingDAo{
  @Autowired
private HibernateTemplate hibernateTemplate;

    @Override
    public List<CencelBooking> getAllCencellation() {
       String hql = "From CencelBooking ceb LEFT JOIN FETCH ceb.customerRegistration LEFT JOIN FETCH ceb.confirmBooking ORDER BY ceb.cencelBookingId";
       return (List<CencelBooking>) hibernateTemplate.find(hql);
    }

    @Override
    public CencelBooking getCencellationNo(int cencellationNo) {
        return  hibernateTemplate.get(CencelBooking.class, cencellationNo);
    }

    @Override
    public void addCencellation(CencelBooking cencelBooking) {
        hibernateTemplate.save(cencelBooking);
    }

    @Override
    public void updateCencellation(CencelBooking cencelBooking) {
        CencelBooking ceb = getCencellationNo(cencelBooking.getCencelBookingId());
        ceb.setCustomerRegistration(cencelBooking.getCustomerRegistration());
        ceb.setConfirmBooking(cencelBooking.getConfirmBooking());
        ceb.setCenceletionDate(cencelBooking.getCenceletionDate());
        hibernateTemplate.update(ceb);
        
    }

    @Override
    public void deleteCencellation(int cencellationNo) {
        hibernateTemplate.delete(getCencellationNo(cencellationNo));
    }
}
