package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.AdminRegistration;

public interface InAddAdminDao {

    List<AdminRegistration> getAllAdmin();

    AdminRegistration getAdminNo(int adminNo);

    void addAdmin(AdminRegistration adminRegistration);

    void updateAdmin(AdminRegistration adminRegistration);

    void deleteAdmin(int adminNo);

    boolean adminExists(String email);

}
