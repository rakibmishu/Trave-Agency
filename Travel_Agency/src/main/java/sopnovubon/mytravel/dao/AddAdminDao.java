
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.AdminRegistration;

@Transactional
@Repository
public class AddAdminDao implements InAddAdminDao{
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<AdminRegistration> getAllAdmin() {
        String hql = " From AdminRegistration as ar ORDER BY ar.adminId";
        return(List < AdminRegistration >) hibernateTemplate.find(hql);
    }

    @Override
    public AdminRegistration getAdminNo(int adminNo) {
        return hibernateTemplate.get(AdminRegistration.class, adminNo);
    }

    @Override
    public void updateAdmin(AdminRegistration adminRegistration) {
//        AdminRegistration registration = getAdminNo(adminRegistration.getAdminId());
//        registration.setFirstName(registration.getFirstName());
//        registration.setLastName(registration.getLastName());
//        registration.setMobile(registration.getMobile());
//        registration.setEMail(registration.getEMail());
//        registration.setUserName(registration.getUserName());
//        registration.setPassword(registration.getPassword());
//        hibernateTemplate.update(registration);
        AdminRegistration ar = getAdminNo(adminRegistration.getAdminId());
        ar.setFirstName(adminRegistration.getFirstName());
        ar.setLastName(adminRegistration.getLastName());
        ar.setMobile(adminRegistration.getMobile());
        ar.setEmail(adminRegistration.getEmail());
        //ar.setEMail(adminRegistration.getEMail());
        ar.setUserName(adminRegistration.getUserName());
        ar.setPassword(adminRegistration.getPassword());
        hibernateTemplate.update(ar);
    }

   

    @Override
    public boolean adminExists(String email) {
        String hql = "FROM AdminRegistration as ar WHERE ar.email=?";
        List<AdminRegistration> arlist = (List<AdminRegistration>) hibernateTemplate.find(hql, email);
        return arlist.size()>0 ? true:false;
    }

    @Override
    public void addAdmin(AdminRegistration adminRegistration) {
        hibernateTemplate.save(adminRegistration);
    }

    @Override
    public void deleteAdmin(int adminNo) {
        hibernateTemplate.delete(getAdminNo(adminNo));
    }
}
