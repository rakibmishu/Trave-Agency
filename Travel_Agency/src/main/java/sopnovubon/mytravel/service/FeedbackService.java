
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InFeedbackDao;
import sopnovubon.mytravel.domain.CustomerFeedback;

@Service
public class FeedbackService implements InFeedbackService {
   @Autowired
   private InFeedbackDao inFeedbackDao;

    @Override
    public List<CustomerFeedback> getAllFeedback() {
        return  inFeedbackDao.getAllFeedback();
    }

    @Override
    public CustomerFeedback getFeedbackNo(int FeedbackNo) {
       CustomerFeedback customerFeedback = inFeedbackDao.getFeedbackNo(FeedbackNo);
       return customerFeedback;
    }

    @Override
    public void addFeedback(CustomerFeedback customerFeedback) {
      inFeedbackDao.addFeedback(customerFeedback);
    }

    @Override
    public void updateFeedback(CustomerFeedback customerFeedback) {
        inFeedbackDao.updateFeedback(customerFeedback);
    }

    @Override
    public void deleteFeedback(int FeedbackNo) {
        inFeedbackDao.deleteFeedback(FeedbackNo);
    }
   
}
