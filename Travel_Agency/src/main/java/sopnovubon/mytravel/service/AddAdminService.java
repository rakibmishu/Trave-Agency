/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InAddAdminDao;
import sopnovubon.mytravel.domain.AdminRegistration;

@Service
public class AddAdminService implements InAddAdminService {
    @Autowired
    private InAddAdminDao inAddAdminDao;

    @Override
    public List<AdminRegistration> getAllAdmin() {
        return inAddAdminDao.getAllAdmin();
    }

    @Override
    public AdminRegistration getAdminNo(int adminNo) {
       AdminRegistration adminRegistration=inAddAdminDao.getAdminNo(adminNo);
    return adminRegistration;
    }

    @Override
    public boolean addAdmin(AdminRegistration adminRegistration) {
        //if(inAddAdminDao.adminExists(adminRegistration.getEMail())){
        if(inAddAdminDao.adminExists(adminRegistration.getEmail())){
        return false;
        }
        else{
        inAddAdminDao.addAdmin(adminRegistration);
        return true;
        }
    }

    @Override
    public void updateAdmin(AdminRegistration adminRegistration) {
        inAddAdminDao.updateAdmin(adminRegistration);
    }
//
//    @Override
//    public void updateObject(BatchInfo obj) {
//        iBatchInfoDAO.updateObject(obj);
//    }
    //
    @Override
    public void deleteAdmin(int adminNo) {
        inAddAdminDao.deleteAdmin(adminNo);
    }
}
