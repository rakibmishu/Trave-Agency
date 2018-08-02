
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.PaymentSystem;


public interface InPaymentSystemService {
     List<PaymentSystem> getAllPayment();

    PaymentSystem getPaymentNo(int PaymentNo);

    void addPayment(PaymentSystem paymentSystem);

    void updatePayment(PaymentSystem paymentSystem);

    void deletePayment(int PaymentNo);
}
