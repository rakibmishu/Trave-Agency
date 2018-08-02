
package sopnovubon.mytravel.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import sopnovubon.mytravel.domain.Pack;

@Transactional
@Repository
public class AddPackDao implements InAddPackDao{
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Pack> getAllPack() {
         String hql = "From Pack pk LEFT JOIN FETCH pk.packageCategory LEFT JOIN FETCH pk.packageSubCategory ORDER BY pk.packId";
       return (List<Pack>) hibernateTemplate.find(hql);
    }

    @Override
    public Pack getPackNo(int packNo) {
        return hibernateTemplate.get(Pack.class, packNo);
    }

    @Override
    public void addPack(Pack pack) {
         hibernateTemplate.save(pack);
    }

    @Override
    public void updatePack(Pack pack) {
//       Pack p = getPackNo(pack.getPackId());
//       p.setPackageCategory(pack.getPackageCategory());
//       p.setPackageSubCategory(pack.getPackageSubCategory());
//       p.setPlace(pack.getPlace());
//       p.setNumberOfDay(pack.getNumberOfDay());
//       p.setNumberOfNight(pack.getNumberOfNight());
//       p.setNumberOfAdult(pack.getNumberOfAdult());
//       p.setNumberOfChild(pack.getNumberOfChild());
//       p.setAccommodationCost(pack.getAccommodationCost());
//       p.setBusCost(pack.getBusCost());
//       p.setTrainCost(pack.getTrainCost());
//       p.setAirCost(pack.getAirCost());
//       p.setGuideServiceCost(pack.getGuideServiceCost());
//       p.setDepartureDate(pack.getDepartureDate());
//       p.setReturnDate(pack.getReturnDate());
//       p.setExtraService(pack.getExtraService());
//       p.setTotal(pack.getTotal());
//       p.setAvailablePackage(pack.getAvailablePackage());
//       p.setHotelName(pack.getHotelName());
//       hibernateTemplate.update(p);
Pack p = getPackNo(pack.getPackId());
p.setPackageCategory(pack.getPackageCategory());
p.setPackageSubCategory(pack.getPackageSubCategory());
p.setPlace(pack.getPlace());
p.setNumberOfDay(pack.getNumberOfDay());
p.setNumberOfNight(pack.getNumberOfNight());
p.setNumberOfAdult(pack.getNumberOfAdult());
p.setNumberOfChild(pack.getNumberOfChild());
p.setAccommodationCost(pack.getAccommodationCost());
p.setBusCost(pack.getBusCost());
p.setTrainCost(pack.getTrainCost());
p.setAirCost(pack.getAirCost());
p.setGuideServiceCost(pack.getGuideServiceCost());
p.setDepartureDate(pack.getDepartureDate());
p.setReturnDate(pack.getReturnDate());
p.setExtraService(pack.getExtraService());
p.setTotal(pack.getTotal());
p.setAvailablePackage(pack.getAvailablePackage());
p.setHotelName(pack.getHotelName());
p.setImageUrl(pack.getImageUrl());
hibernateTemplate.update(p);

       
    }

    @Override
    public void deletePack(int packNo) {
       
       hibernateTemplate.delete(getPackNo(packNo));
    }
    
    
}
