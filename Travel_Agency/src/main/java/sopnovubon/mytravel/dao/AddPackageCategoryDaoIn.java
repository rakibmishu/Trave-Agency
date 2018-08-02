package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.PackageCategory;

public interface AddPackageCategoryDaoIn {

    List<PackageCategory> getAllPackage();

    PackageCategory getPackageNo(int packageNo);

    void addPackage(PackageCategory packageCategory);

    void updatePackage(PackageCategory packageCategory);

    void deletePackage(int packageNo);

    boolean packageExists(String email);
}
