package sopnovubon.mytravel.domain;
// Generated Jul 23, 2018 9:00:19 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * AdminRegistration generated by hbm2java
 */
@Entity
@Table(name="admin_registration"
    ,catalog="sopnovubon"
)
public class AdminRegistration  implements java.io.Serializable {


     private Integer adminId;
     private String firstName;
     private String lastName;
     private String mobile;
     private String email;
     private String userName;
     private String password;

    public AdminRegistration() {
    }

    public AdminRegistration(String firstName, String lastName, String mobile, String email, String userName, String password) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.mobile = mobile;
       this.email = email;
       this.userName = userName;
       this.password = password;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="admin_id", unique=true, nullable=false)
    public Integer getAdminId() {
        return this.adminId;
    }
    
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    
    @Column(name="first_name", nullable=false, length=20)
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    
    @Column(name="last_name", nullable=false, length=20)
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    
    @Column(name="mobile", nullable=false, length=20)
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    
    @Column(name="email", nullable=false, length=30)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="user_name", nullable=false, length=45)
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }

    
    @Column(name="password", nullable=false, length=45)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}


