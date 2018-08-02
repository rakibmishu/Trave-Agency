package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.PackageCategory;

public interface AddPackageCategoryServiceIn {

    List<PackageCategory> getAllPackage();

    PackageCategory getPackageNo(int packageNo);

    boolean addPackage(PackageCategory packageCategory);

    void updatePackageCategory(PackageCategory packageCategory);

    void deletePackageCategory(int packageNo);

}

