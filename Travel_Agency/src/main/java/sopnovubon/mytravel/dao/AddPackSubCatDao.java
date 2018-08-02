
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.PackageSubCategory;

@Transactional
@Repository
public class AddPackSubCatDao implements InAddPackSubCatDao{
    @Autowired
    private HibernateTemplate hibernateTemplate;
    
   

    @Override
    public List<PackageSubCategory> getAllSubPack() {
       String hql = "From PackageSubCategory psc LEFT JOIN FETCH psc.packageCategory ORDER BY psc.packSubCatId";
       return (List<PackageSubCategory>) hibernateTemplate.find(hql);
    }

    @Override
    public PackageSubCategory getSubPackNo(int subPackNo) {
       return hibernateTemplate.get(PackageSubCategory.class, subPackNo);
       
    }

    @Override
    public void addSubPack(PackageSubCategory packageSubCategory) {
        hibernateTemplate.save(packageSubCategory);
    }

    @Override
    public void updateSubPackage(PackageSubCategory packageSubCategory) {
       PackageSubCategory psc = getSubPackNo( packageSubCategory.getPackSubCatId());
       psc.setPackageCategory(packageSubCategory.getPackageCategory());
       psc.setPackSubCatName(packageSubCategory.getPackSubCatName());
       hibernateTemplate.update(psc);
       
    }

    @Override
    public void deleteSubPackage(int subPackNo) {
        hibernateTemplate.delete(getSubPackNo(subPackNo));
    }
}
