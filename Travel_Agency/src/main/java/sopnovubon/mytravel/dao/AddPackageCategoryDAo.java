     
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.PackageCategory;

@Transactional
@Repository
public class AddPackageCategoryDAo implements AddPackageCategoryDaoIn{
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<PackageCategory> getAllPackage() {
        String hql = " From PackageCategory as pc ORDER BY pc.packCatId ";
        return (List<PackageCategory>) hibernateTemplate.find(hql);
    }

    @Override
    public PackageCategory getPackageNo(int packageNo) {
        return  hibernateTemplate.get(PackageCategory.class, packageNo);
    }

    @Override
    public void addPackage(PackageCategory packageCategory) {
        hibernateTemplate.save(packageCategory);
    }
    
   

    @Override
    public void updatePackage(PackageCategory packageCategory) {
       PackageCategory pc= getPackageNo(packageCategory.getPackCatId());
       pc.setPackCatName(packageCategory.getPackCatName());
        hibernateTemplate.update(pc);
        
    }
    
    //
//    @Override
//    public void updatePerson(Person person) {
//        Person p = getPersonById(person.getPid());
//        p.setName(person.getName());
//        p.setLocation(person.getLocation());
//        hibernateTemplate.update(p);
//    }
//    @Override
//    public void updateDepartment(Department department) {
//        Department d = getDepartmentById(department.getDepartmentId());
//        d.setDepartmentName(department.getDepartmentName());
//        d.setLocation(department.getLocation());
//        hibernateTemplate.update(d); 
//    }
    //
    

    @Override
    public void deletePackage(int packageNo) {
        hibernateTemplate.delete(getPackageNo(packageNo));
    }

    @Override
            
  public boolean packageExists(String name) {
        String hql = " FROM PackageCategory as pc WHERE pc.packCatName=? ";
         List<PackageCategory> pclist = (List<PackageCategory>) hibernateTemplate.find(hql, name);
//        List<PackageCategory> packagelist= (List<PackageCategory>).hibernateTemplate.find(hql, name,id);
        return pclist.size()>0 ? true:false;
    }
}
