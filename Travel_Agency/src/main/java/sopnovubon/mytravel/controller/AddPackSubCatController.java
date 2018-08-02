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
import sopnovubon.mytravel.service.InAddPackSubCatservice;

@Controller
@RequestMapping("/subPackages")
public class AddPackSubCatController {

    @Autowired
    private InAddPackSubCatservice inAddPackSubCatservice;

    @RequestMapping("/home")
    public String Home() {
        return "packageSubCategory";
    }
  
    //
//    @RequestMapping(value = "/facultylist", method = RequestMethod.GET)
//    public ResponseEntity<List<TspFaculty>> getAllFaculty() {
//        List<TspFaculty> list = iTspFacultyService.getAllObject();
//        return new ResponseEntity<List<TspFaculty>>(list, HttpStatus.OK);
//    }
    //
    
    
    @RequestMapping(value = "/packageSubCategory", method = RequestMethod.GET)
    public ResponseEntity<List<PackageSubCategory>> getAllSubPackage() {
        List<PackageSubCategory> list = inAddPackSubCatservice.getAllSubPackage();
        return new ResponseEntity<List<PackageSubCategory>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/packageSubCategory/{id}", method = RequestMethod.GET)
    public ResponseEntity<PackageSubCategory> getPackSubCatById(@PathVariable("id") Integer id) {
        PackageSubCategory packageSubCategory = inAddPackSubCatservice.getSubPackageNo(id);
        return new ResponseEntity<PackageSubCategory>(packageSubCategory, HttpStatus.OK);
    }

    @RequestMapping(value = "/packageSubCategory", method = RequestMethod.POST)
    public ResponseEntity<Void> addSubPackage(@RequestBody PackageSubCategory packageSubCategory, UriComponentsBuilder builder) {
        inAddPackSubCatservice.addSubPackage(packageSubCategory);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/packageSubCategory/{id}").buildAndExpand(packageSubCategory.getPackSubCatId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/packageSubCategory/{id}", method = RequestMethod.PUT)
    public ResponseEntity<PackageSubCategory> updateSubPackage(@RequestBody PackageSubCategory packageCategory) {
        inAddPackSubCatservice.updateSubPackage(packageCategory);
        return new ResponseEntity<PackageSubCategory>(packageCategory, HttpStatus.OK);

    }

    @RequestMapping(value = "/packageSubCategory/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteSubPackage(@PathVariable("id") Integer id) {
        inAddPackSubCatservice.deleteSubPackage(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }

}
