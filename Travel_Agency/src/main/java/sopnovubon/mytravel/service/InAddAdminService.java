/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.AdminRegistration;

public interface InAddAdminService {

    List<AdminRegistration> getAllAdmin();

    AdminRegistration getAdminNo(int adminNo);

    boolean addAdmin(AdminRegistration adminRegistration);

    void updateAdmin(AdminRegistration adminRegistration);

    void deleteAdmin(int adminNo);
}
