
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InAddCustomerDao;
import sopnovubon.mytravel.domain.CustomerRegistration;

@Service
public class AddCustomerService implements InAddCustomerService{
    @Autowired
   private InAddCustomerDao inAddCustomerDao;

    @Override
    public List<CustomerRegistration> getAllCustomer() {
       return inAddCustomerDao.getAllCustomer();
    }

    @Override
    public CustomerRegistration getCustomerNo(int customerNo) {
        CustomerRegistration customerRegistration = inAddCustomerDao.getCustomerNo(customerNo);
        return customerRegistration;
    }

    @Override
    public boolean addCustomer(CustomerRegistration customerRegistration) {
        //if(inAddCustomerDao.customerExists(customerRegistration.getEMail())){
        if(inAddCustomerDao.customerExists(customerRegistration.getEmail())){
        return false;
        }
        else{
        inAddCustomerDao.addCustomer(customerRegistration);
        return true;
        }
    }

    @Override
    public void updateCustomer(CustomerRegistration customerRegistration) {
        inAddCustomerDao.updateCustomer(customerRegistration);
    }

    @Override
    public void deleteCustomer(int customerNo) {
       inAddCustomerDao.deleteCustomer(customerNo);
    }
}
