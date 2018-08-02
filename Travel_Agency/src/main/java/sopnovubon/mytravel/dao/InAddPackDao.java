
package sopnovubon.mytravel.dao;

import java.util.List;
import sopnovubon.mytravel.domain.Pack;


public interface InAddPackDao {
    List<Pack> getAllPack();

    Pack getPackNo(int packNo);

    void addPack(Pack pack);

    void updatePack(Pack pack);

    void deletePack(int packNo);
}
