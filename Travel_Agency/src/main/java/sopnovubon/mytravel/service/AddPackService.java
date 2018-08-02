
package sopnovubon.mytravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sopnovubon.mytravel.dao.InAddPackDao;
import sopnovubon.mytravel.domain.Pack;


@Service
public class AddPackService implements InAddPackService {
    @Autowired
    private InAddPackDao inAddPackDao;

    @Override
    public List<Pack> getAllPack() {
        return inAddPackDao.getAllPack();
    }

    @Override
    public Pack getPackNo(int PackNo) {
       Pack pack = inAddPackDao.getPackNo(PackNo);
       return pack;
    }

    @Override
    public void addPack(Pack pack) {
       inAddPackDao.addPack(pack);
    }

    @Override
    public void updatePack(Pack pack) {
        System.out.println("pack: "+pack.toString());
        inAddPackDao.updatePack(pack);
//        inAddPackDao.updatePack(pack);
    }

    @Override
    public void deletePack(int PackNo) {
        inAddPackDao.deletePack(PackNo);
    }
    
}
