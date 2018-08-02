package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.PaymentSystem;

@Transactional
@Repository
public class PaymentSystemDao implements InPaymentSystemDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<PaymentSystem> getAllPayment() {
        String hql = "From PaymentSystem ps LEFT JOIN FETCH ps.customerRegistration LEFT JOIN FETCH ps.confirmBooking ORDER BY ps.paymentId";
        return (List<PaymentSystem>) hibernateTemplate.find(hql);
    }

    @Override
    public PaymentSystem getPaymentNo(int PaymentNo) {
        return hibernateTemplate.get(PaymentSystem.class, PaymentNo);
    }

    @Override
    public void addPayment(PaymentSystem paymentSystem) {
        hibernateTemplate.save(paymentSystem);
    }

    @Override
    public void updatePayment(PaymentSystem paymentSystem) {
        PaymentSystem ps = getPaymentNo(paymentSystem.getPaymentId());
        ps.setConfirmBooking(paymentSystem.getConfirmBooking());
        ps.setCustomerRegistration(paymentSystem.getCustomerRegistration());
        ps.setCardNo(paymentSystem.getCardNo());
        ps.setCvvNo(paymentSystem.getCvvNo());
        ps.setExpireDate(paymentSystem.getExpireDate());
        hibernateTemplate.update(ps);
    }

    @Override
    public void deletePayment(int PaymentNo) {
        hibernateTemplate.delete(getPaymentNo(PaymentNo));
    }
}
