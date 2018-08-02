
package sopnovubon.mytravel.configuration;

import sopnovubon.mytravel.domain.AdminRegistration;
import sopnovubon.mytravel.domain.CencelBooking;
import sopnovubon.mytravel.domain.ConfirmBooking;
import sopnovubon.mytravel.domain.ConfirmHotelReservation;
import sopnovubon.mytravel.domain.CustomerFeedback;
import sopnovubon.mytravel.domain.CustomerRegistration;
import sopnovubon.mytravel.domain.HotelReservation;
import sopnovubon.mytravel.domain.Pack;
import sopnovubon.mytravel.domain.PackageCategory;
import sopnovubon.mytravel.domain.PackageSubCategory;
import sopnovubon.mytravel.domain.PaymentSystem;

import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author Faculty
 */
@Configuration
@EnableTransactionManagement
public class DBConfig {

    @Bean
    public HibernateTemplate hibernateTemplate() {
        return new HibernateTemplate(sessionFactory().getObject());
    }

//    @Bean
//    public SessionFactory sessionFactory() {
//        return new LocalSessionFactoryBuilder(getDataSource())
//                .addAnnotatedClasses(Person.class, BatchInfo.class, ExamMarks.class
//                ,ExamSchedule.class,LoginInfo.class, StudentInfo.class,  StudentJobStatus.class
//                , TspFaculty.class, TspInfo.class, TspTc.class, UserRole.class)                               
//                .buildSessionFactory();
//        
//    }
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(getDataSource());
        sessionFactory.setPackagesToScan(new String[] { "sopnovubon.mytravel.domain" });
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
     }

    @Bean
    public DataSource getDataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/sopnovubon");
        dataSource.setUsername("root");
        dataSource.setPassword("123");
        return dataSource;
    }

//    @Bean
//    public HibernateTransactionManager hibTransMan() {
//        return new HibernateTransactionManager(sessionFactory());
//    }
    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        properties.put("hibernate.show_sql", true);
        properties.put("hibernate.format_sql", true);
        return properties;        
    }
}
