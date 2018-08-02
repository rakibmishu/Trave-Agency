package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.PackageSubCategory;

public interface InAddPackSubCatservice {

    List<PackageSubCategory> getAllSubPackage();

    PackageSubCategory getSubPackageNo(int subPackageNo);

    void addSubPackage(PackageSubCategory packageSubCategory);

    void updateSubPackage(PackageSubCategory packageSubCategory);

    void deleteSubPackage(int subPackageNo);
}
