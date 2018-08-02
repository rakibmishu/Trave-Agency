package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.CustomerRegistration;

public interface InAddCustomerDao {

    List<CustomerRegistration> getAllCustomer();

    CustomerRegistration getCustomerNo(int customerNo);

    void addCustomer(CustomerRegistration customerRegistration);

    void updateCustomer(CustomerRegistration customerRegistration);

    void deleteCustomer(int customerNo);

    boolean customerExists(String email);
}
