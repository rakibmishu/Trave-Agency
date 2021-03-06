package sopnovubon.mytravel.domain;
// Generated Jul 23, 2018 9:00:19 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ConfirmBooking generated by hbm2java
 */
@Entity
@Table(name="confirm_booking"
    ,catalog="sopnovubon"
)
public class ConfirmBooking  implements java.io.Serializable {


     private Integer bookingId;
     private CustomerRegistration customerRegistration;
     private Pack pack;
     private Date confirmDate;
     private Set<CencelBooking> cencelBookings = new HashSet<CencelBooking>(0);
     private Set<PaymentSystem> paymentSystems = new HashSet<PaymentSystem>(0);

    public ConfirmBooking() {
    }

	
    public ConfirmBooking(CustomerRegistration customerRegistration, Pack pack, Date confirmDate) {
        this.customerRegistration = customerRegistration;
        this.pack = pack;
        this.confirmDate = confirmDate;
    }
    public ConfirmBooking(CustomerRegistration customerRegistration, Pack pack, Date confirmDate, Set<CencelBooking> cencelBookings, Set<PaymentSystem> paymentSystems) {
       this.customerRegistration = customerRegistration;
       this.pack = pack;
       this.confirmDate = confirmDate;
       this.cencelBookings = cencelBookings;
       this.paymentSystems = paymentSystems;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="booking_id", unique=true, nullable=false)
    public Integer getBookingId() {
        return this.bookingId;
    }
    
    public void setBookingId(Integer bookingId) {
        this.bookingId = bookingId;
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

    @Temporal(TemporalType.DATE)
    @Column(name="confirm_Date", nullable=false, length=10)
    public Date getConfirmDate() {
        return this.confirmDate;
    }
    
    public void setConfirmDate(Date confirmDate) {
        this.confirmDate = confirmDate;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="confirmBooking")
    public Set<CencelBooking> getCencelBookings() {
        return this.cencelBookings;
    }
    
    public void setCencelBookings(Set<CencelBooking> cencelBookings) {
        this.cencelBookings = cencelBookings;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="confirmBooking")
    public Set<PaymentSystem> getPaymentSystems() {
        return this.paymentSystems;
    }
    
    public void setPaymentSystems(Set<PaymentSystem> paymentSystems) {
        this.paymentSystems = paymentSystems;
    }




}


