package sopnovubon.mytravel.domain;
// Generated Jul 23, 2018 9:00:19 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CustomerFeedback generated by hbm2java
 */
@Entity
@Table(name="customer_feedback"
    ,catalog="sopnovubon"
)
public class CustomerFeedback  implements java.io.Serializable {


     private Integer feedbackId;
     private CustomerRegistration customerRegistration;
     private Pack pack;
     private String comment;
     private Date feedbackDate;

    public CustomerFeedback() {
    }

    public CustomerFeedback(CustomerRegistration customerRegistration, Pack pack, String comment, Date feedbackDate) {
       this.customerRegistration = customerRegistration;
       this.pack = pack;
       this.comment = comment;
       this.feedbackDate = feedbackDate;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="feedback_id", unique=true, nullable=false)
    public Integer getFeedbackId() {
        return this.feedbackId;
    }
    
    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cust_id", nullable=false)
    public CustomerRegistration getCustomerRegistration() {
        return this.customerRegistration;
    }
    
    public void setCustomerRegistration(CustomerRegistration customerRegistration) {
        this.customerRegistration = customerRegistration;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="pack_id", nullable=false)
    public Pack getPack() {
        return this.pack;
    }
    
    public void setPack(Pack pack) {
        this.pack = pack;
    }

    
    @Column(name="comment", nullable=false, length=500)
    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="feedback_Date", nullable=false, length=10)
    public Date getFeedbackDate() {
        return this.feedbackDate;
    }
    
    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }




}


