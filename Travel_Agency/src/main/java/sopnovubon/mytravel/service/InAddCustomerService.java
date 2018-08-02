package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.CustomerRegistration;

public interface InAddCustomerService {

    List<CustomerRegistration> getAllCustomer();

    CustomerRegistration getCustomerNo(int customerNo);

    boolean addCustomer(CustomerRegistration customerRegistration);

    void updateCustomer(CustomerRegistration customerRegistration);

    void deleteCustomer(int customerNo);

}
