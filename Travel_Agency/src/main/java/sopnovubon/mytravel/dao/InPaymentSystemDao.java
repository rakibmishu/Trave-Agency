
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.PaymentSystem;


public interface InPaymentSystemDao {
     List<PaymentSystem> getAllPayment();

    PaymentSystem getPaymentNo(int PaymentNo);

    void addPayment(PaymentSystem paymentSystem);

    void updatePayment(PaymentSystem paymentSystem);

    void deletePayment(int PaymentNo);
}
