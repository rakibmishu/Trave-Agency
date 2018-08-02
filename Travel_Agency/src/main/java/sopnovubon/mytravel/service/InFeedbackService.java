
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.CustomerFeedback;


public interface InFeedbackService {
     List<CustomerFeedback> getAllFeedback();

    CustomerFeedback getFeedbackNo(int FeedbackNo);

    void addFeedback(CustomerFeedback customerFeedback);

    void updateFeedback(CustomerFeedback customerFeedback);

    void deleteFeedback(int FeedbackNo);
}
