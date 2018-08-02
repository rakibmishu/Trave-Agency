package sopnovubon.mytravel.controller;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import sopnovubon.mytravel.domain.PackageCategory;
import sopnovubon.mytravel.service.AddPackageCategoryServiceIn;
@Controller
@RequestMapping("/packages")
public class AddPackageCategoryController {

    @Autowired
    private AddPackageCategoryServiceIn packageCategoryServiceIn;

    @RequestMapping("/home")
    public String home() {
        return "packageCategory";
    }

    @RequestMapping(value = "/packageCategory/{id}", method = RequestMethod.GET)
    public ResponseEntity<PackageCategory> getPackageCategoryById(@PathVariable("id") Integer id) {
        PackageCategory packageCategory = packageCategoryServiceIn.getPackageNo(id);
        return new ResponseEntity<PackageCategory>(packageCategory, HttpStatus.OK);
    }

    @RequestMapping(value = "/packageCategory", method = RequestMethod.GET)
    
    public ResponseEntity<List<PackageCategory>> getAllPackage() {
        List<PackageCategory> list = packageCategoryServiceIn.getAllPackage();
        return new ResponseEntity<List<PackageCategory>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/packageCategory", method = RequestMethod.POST)
    public ResponseEntity<Void> addPackage(@RequestBody PackageCategory packageCategory, UriComponentsBuilder builder) {
        boolean flag = packageCategoryServiceIn.addPackage(packageCategory);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/packageCategory/{id}").buildAndExpand(packageCategory.getPackCatId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
   

    @RequestMapping(value = "/packageCategory/{id}", method = RequestMethod.PUT)
    public ResponseEntity<PackageCategory> updatePackage(@RequestBody PackageCategory packageCategory) {

        packageCategoryServiceIn.updatePackageCategory(packageCategory);
        return new ResponseEntity<PackageCategory>(packageCategory, HttpStatus.OK);
    }
   
    @RequestMapping(value = "/packageCategory/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deletePackage(@PathVariable("id") Integer id) {
        packageCategoryServiceIn.deletePackageCategory(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
