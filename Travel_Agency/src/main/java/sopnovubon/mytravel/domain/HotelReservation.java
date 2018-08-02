package sopnovubon.mytravel.domain;
// Generated Jul 23, 2018 9:00:19 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * HotelReservation generated by hbm2java
 */
@Entity
@Table(name="hotel_reservation"
    ,catalog="sopnovubon"
)
public class HotelReservation  implements java.io.Serializable {


     private Integer hotelId;
     private String hotelPlace;
     private String hotelName;
     private double roomTypeCost;
     private Double facilitiesCost;
     private int availableRoom;
     private String imageUrl;
     private Set<ConfirmHotelReservation> confirmHotelReservations = new HashSet<ConfirmHotelReservation>(0);

    public HotelReservation() {
    }

	
    public HotelReservation(String hotelPlace, String hotelName, double roomTypeCost, int availableRoom, String imageUrl) {
        this.hotelPlace = hotelPlace;
        this.hotelName = hotelName;
        this.roomTypeCost = roomTypeCost;
        this.availableRoom = availableRoom;
        this.imageUrl = imageUrl;
    }
    public HotelReservation(String hotelPlace, String hotelName, double roomTypeCost, Double facilitiesCost, int availableRoom, String imageUrl, Set<ConfirmHotelReservation> confirmHotelReservations) {
       this.hotelPlace = hotelPlace;
       this.hotelName = hotelName;
       this.roomTypeCost = roomTypeCost;
       this.facilitiesCost = facilitiesCost;
       this.availableRoom = availableRoom;
       this.imageUrl = imageUrl;
       this.confirmHotelReservations = confirmHotelReservations;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="hotel_id", unique=true, nullable=false)
    public Integer getHotelId() {
        return this.hotelId;
    }
    
    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    
    @Column(name="hotel_place", nullable=false, length=50)
    public String getHotelPlace() {
        return this.hotelPlace;
    }
    
    public void setHotelPlace(String hotelPlace) {
        this.hotelPlace = hotelPlace;
    }

    
    @Column(name="hotel_name", nullable=false, length=50)
    public String getHotelName() {
        return this.hotelName;
    }
    
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    
    @Column(name="room_type_cost", nullable=false, precision=22, scale=0)
    public double getRoomTypeCost() {
        return this.roomTypeCost;
    }
    
    public void setRoomTypeCost(double roomTypeCost) {
        this.roomTypeCost = roomTypeCost;
    }

    
    @Column(name="facilities_cost", precision=22, scale=0)
    public Double getFacilitiesCost() {
        return this.facilitiesCost;
    }
    
    public void setFacilitiesCost(Double facilitiesCost) {
        this.facilitiesCost = facilitiesCost;
    }

    
    @Column(name="Available_room", nullable=false)
    public int getAvailableRoom() {
        return this.availableRoom;
    }
    
    public void setAvailableRoom(int availableRoom) {
        this.availableRoom = availableRoom;
    }

    
    @Column(name="imageURL", nullable=false, length=200)
    public String getImageUrl() {
        return this.imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="hotelReservation")
    public Set<ConfirmHotelReservation> getConfirmHotelReservations() {
        return this.confirmHotelReservations;
    }
    
    public void setConfirmHotelReservations(Set<ConfirmHotelReservation> confirmHotelReservations) {
        this.confirmHotelReservations = confirmHotelReservations;
    }




}

