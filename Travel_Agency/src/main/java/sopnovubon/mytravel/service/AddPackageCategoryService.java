/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.AddPackageCategoryDaoIn;
import sopnovubon.mytravel.domain.PackageCategory;

@Service
public class AddPackageCategoryService implements AddPackageCategoryServiceIn{
 
 @Autowired
 private AddPackageCategoryDaoIn addPackageCategoryDaoIn;
   
     @Override
    public List<PackageCategory> getAllPackage() {
       return addPackageCategoryDaoIn.getAllPackage();
    }

    @Override
    public PackageCategory getPackageNo(int packageNo) {
       PackageCategory packageCategory= addPackageCategoryDaoIn.getPackageNo(packageNo);
       return packageCategory;
    }

    @Override
    public boolean addPackage(PackageCategory packageCategory) {
       if(addPackageCategoryDaoIn.packageExists(packageCategory.getPackCatName())){
       return false;
       }
       else{
       addPackageCategoryDaoIn.addPackage(packageCategory);
       return true;
       }
    }

    @Override
    public void updatePackageCategory(PackageCategory packageCategory) {
        addPackageCategoryDaoIn.updatePackage(packageCategory);
    }

    @Override
    public void deletePackageCategory(int packageNo) {
        addPackageCategoryDaoIn.deletePackage(packageNo);
    }
    
}
