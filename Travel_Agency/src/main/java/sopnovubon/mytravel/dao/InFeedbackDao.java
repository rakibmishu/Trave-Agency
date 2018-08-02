
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.CustomerFeedback;


public interface InFeedbackDao {
     List<CustomerFeedback> getAllFeedback();

    CustomerFeedback getFeedbackNo(int FeedbackNo);

    void addFeedback(CustomerFeedback customerFeedback);

    void updateFeedback(CustomerFeedback customerFeedback);

    void deleteFeedback(int FeedbackNo);
}

