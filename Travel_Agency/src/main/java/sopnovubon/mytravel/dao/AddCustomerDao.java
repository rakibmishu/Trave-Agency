
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.CustomerRegistration;

@Transactional
@Repository
public class AddCustomerDao implements InAddCustomerDao{
   @Autowired 
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<CustomerRegistration> getAllCustomer() {
         String hql = " From CustomerRegistration as ar ORDER BY ar.custId";
        return(List < CustomerRegistration >) hibernateTemplate.find(hql);
    }

    @Override
    public CustomerRegistration getCustomerNo(int customerNo) {
         return hibernateTemplate.get(CustomerRegistration.class, customerNo);
    }

    @Override
    public void addCustomer(CustomerRegistration customerRegistration) {
        hibernateTemplate.save(customerRegistration);
    }

    @Override
    public void updateCustomer(CustomerRegistration customerRegistration) {
       CustomerRegistration cr = getCustomerNo(customerRegistration.getCustId());
       cr.setFirstName(customerRegistration.getFirstName());
       cr.setLastName(customerRegistration.getLastName());
       cr.setAddress(customerRegistration.getAddress());
       cr.setMobile(customerRegistration.getMobile());
       //cr.setEMail(customerRegistration.getEMail());
       cr.setEmail(customerRegistration.getEmail());
       cr.setUserName(customerRegistration.getUserName());
       cr.setPassword(customerRegistration.getPassword());
       hibernateTemplate.update(cr);
    }

    @Override
    public void deleteCustomer(int customerNo) {
        hibernateTemplate.delete(getCustomerNo(customerNo));
    }

    @Override
    public boolean customerExists(String email) {
       String hql = "From CustomerRegistration as cr WHERE cr.email = ?";
       List<CustomerRegistration> crlist = (List<CustomerRegistration>) hibernateTemplate.find(hql, email);
       return crlist.size()>0 ? true:false;
    }
}
