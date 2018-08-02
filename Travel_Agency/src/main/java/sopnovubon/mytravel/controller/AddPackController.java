package sopnovubon.mytravel.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;
import sopnovubon.mytravel.domain.Pack;
import sopnovubon.mytravel.domain.PackageSubCategory;
import sopnovubon.mytravel.service.InAddPackService;

@Controller
@RequestMapping("/pacs")
public class AddPackController {

    @Autowired
    private InAddPackService inAddPackService;

    @RequestMapping("/home")
    public String Home() {
        return "pack";
    }

    @RequestMapping(value = "/pack", method = RequestMethod.GET)
    public ResponseEntity<List<Pack>> getAllPack() {
        List<Pack> list = inAddPackService.getAllPack();
        return new ResponseEntity<List<Pack>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/pack/{id}", method = RequestMethod.GET)
    public ResponseEntity<Pack> getPackById(@PathVariable("id") Integer id) {
        Pack pack = inAddPackService.getPackNo(id);
        return new ResponseEntity<Pack>(pack, HttpStatus.OK);
    }

    @RequestMapping(value = "/pack", method = RequestMethod.POST)
    public ResponseEntity<Void> addPack(@RequestBody Pack pack, UriComponentsBuilder builder) {
        inAddPackService.addPack(pack);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/pack/{id}").buildAndExpand(pack.getPackId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
   
    @RequestMapping(value = "/pack/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Pack> updatePack(@RequestBody Pack pack) {
        inAddPackService.updatePack(pack);
        return new ResponseEntity<Pack>(pack, HttpStatus.OK);

    }

    @RequestMapping(value = "/pack/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deletePack(@PathVariable("id") Integer id) {
        inAddPackService.deletePack(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
