
package sopnovubon.mytravel.service;

import java.util.List;
import sopnovubon.mytravel.domain.Pack;


public interface InAddPackService {
 List<Pack> getAllPack();

    Pack getPackNo(int PackNo);

    void addPack(Pack pack);

    void updatePack(Pack pack);

    void deletePack(int PackNo);
   
}
