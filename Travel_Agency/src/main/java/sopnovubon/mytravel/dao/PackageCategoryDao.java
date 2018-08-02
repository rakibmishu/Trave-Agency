
package sopnovubon.mytravel.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class PackageCategoryDao {
    
    @Autowired
   private HibernateTemplate hibernateTemplate;
    
   
    
   
}
