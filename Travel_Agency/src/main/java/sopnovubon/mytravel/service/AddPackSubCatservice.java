
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InAddPackSubCatDao;
import sopnovubon.mytravel.domain.PackageSubCategory;

@Service
public class AddPackSubCatservice implements InAddPackSubCatservice{
  @Autowired
  private InAddPackSubCatDao inAddPackSubCatDao;
 
    @Override
    public List<PackageSubCategory> getAllSubPackage() {
        return inAddPackSubCatDao.getAllSubPack();
    }

    @Override
    public PackageSubCategory getSubPackageNo(int subPackageNo) {
       PackageSubCategory packageSubCategory = inAddPackSubCatDao.getSubPackNo(subPackageNo);
       return packageSubCategory;
    }

    @Override
    public void addSubPackage(PackageSubCategory packageSubCategory) {
       inAddPackSubCatDao.addSubPack(packageSubCategory);
    }

    @Override
    public void updateSubPackage(PackageSubCategory packageSubCategory) {
        inAddPackSubCatDao.updateSubPackage(packageSubCategory);
    }

    @Override
    public void deleteSubPackage(int subPackageNo) {
        inAddPackSubCatDao.deleteSubPackage(subPackageNo);
    }
 
}
