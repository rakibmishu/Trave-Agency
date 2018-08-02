
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InPaymentSystemDao;
import sopnovubon.mytravel.domain.PaymentSystem;

@Service
public class PaymentSystemService implements InPaymentSystemService {
  @Autowired  
  private InPaymentSystemDao inPaymentSystemDao;

    @Override
    public List<PaymentSystem> getAllPayment() {
        return inPaymentSystemDao.getAllPayment();
    }

    @Override
    public PaymentSystem getPaymentNo(int PaymentNo) {
        PaymentSystem paymentSystem= inPaymentSystemDao.getPaymentNo(PaymentNo);
        return  paymentSystem;
    }

    @Override
    public void addPayment(PaymentSystem paymentSystem) {
       inPaymentSystemDao.addPayment(paymentSystem);
    }

    @Override
    public void updatePayment(PaymentSystem paymentSystem) {
       inPaymentSystemDao.updatePayment(paymentSystem);
    }

    @Override
    public void deletePayment(int PaymentNo) {
       inPaymentSystemDao.deletePayment(PaymentNo);
    }
  
}
