
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.CustomerFeedback;

@Transactional
@Repository
public class FeedbackDao implements InFeedbackDao {
   @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<CustomerFeedback> getAllFeedback() {
        String hql = "From CustomerFeedback cf LEFT JOIN FETCH cf.customerRegistration LEFT JOIN FETCH cf.pack ORDER BY cf.feedbackId";
       return (List<CustomerFeedback>) hibernateTemplate.find(hql);
    }

    @Override
    public CustomerFeedback getFeedbackNo(int FeedbackNo) {
        return hibernateTemplate.get(CustomerFeedback.class, FeedbackNo);
    }

    @Override
    public void addFeedback(CustomerFeedback customerFeedback) {
       hibernateTemplate.save(customerFeedback);
    }

    @Override
    public void updateFeedback(CustomerFeedback customerFeedback) {
        CustomerFeedback cb = getFeedbackNo(customerFeedback.getFeedbackId());
        cb.setPack(customerFeedback.getPack());
        cb.setCustomerRegistration(customerFeedback.getCustomerRegistration());
        cb.setComment(customerFeedback.getComment());
        cb.setFeedbackDate(customerFeedback.getFeedbackDate());
        hibernateTemplate.update(cb);
    }

    @Override
    public void deleteFeedback(int FeedbackNo) {
        hibernateTemplate.delete(getFeedbackNo(FeedbackNo));
    }
   
}
