package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.PackageSubCategory;

public interface InAddPackSubCatDao {

    List<PackageSubCategory> getAllSubPack();

    PackageSubCategory getSubPackNo(int subPackNo);

    void addSubPack(PackageSubCategory packageSubCategory);

    void updateSubPackage(PackageSubCategory packageSubCategory);

    void deleteSubPackage(int subPackNo);
}
