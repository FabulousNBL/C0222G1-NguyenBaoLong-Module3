package service.customer.impl;

import model.customer.Customer;
import repository.customer.CustomerRepo;
import repository.customer.impl.CustomerRepoImpl;
import service.customer.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {

    CustomerRepo customerRepo= new CustomerRepoImpl();
    private static final String CUSTOMER_ID= "^KH-[0-9]{4}$";
    private static final String ID_CARD= "^[0-9]{9}|[0-9]{12}$";
    private static final String PHONE= "^(090[0-9]{7})|(091[0-9]{7})|(\\(84\\)\\+90[0-9]{7})|(\\(84\\)\\+91[0-9]{7})$";
    private static final String EMAIL= "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";


    @Override
    public List<Customer> findAll() {
        return customerRepo.findAll();
    }

    @Override
    public Map<String, String> create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> map = new LinkedHashMap<>();


        String id = request.getParameter("id");
        if (!id.matches(CUSTOMER_ID)){
            map.put("id","Sai định dạng, mã khách hàng có định dạng là KH-XXXX ( với x là số từ 0-9");
        }
        if(id== ""){
            map.put("id","Cột này không được để trốnd");
        }

        String typeId= request.getParameter("typeId");
//        try {
//            customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
//            if (customerTypeId < 1 || customerTypeId > 5) {
//                map.put("customerTypeId", "Chỉ được nhập từ 1 đến 5");
//            }
//        } catch (NumberFormatException o) {
//            map.put("customerTypeId", "Không được nhập chữ hoặc để trống hoặc nhập chữ");
//        }
        if(typeId== ""){
            map.put("typeId","Cột này không được để trốnd");
        }
        String name = request.getParameter("name");
        if(name== ""){
            map.put("name","Cột này không được để trốnd");
        }
        String birthday = request.getParameter("birthday");
        if(birthday== ""){
            map.put("birthday","Cột này không được để trốnd");
        }
        int gender = 0;
        try{
            gender=Integer.parseInt(request.getParameter("gender"));
        }catch (Exception e){
            map.put("gender","Cột này không được để trống");
        }
        String idCard = request.getParameter("idCard");
        if(idCard== ""){
            map.put("idCard","Cột này không được để trốnd");
        }
        if (!idCard.matches(ID_CARD)) {
            map.put("idCard", "Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)");
        }

        String phone = request.getParameter("phone");
        if (!phone.matches(PHONE)) {
            map.put("idCard", "Bao gồm các số bắt đầu bằng 090, 091, (84)+ 90 hoặc (84)+ 91 và kết thúc bằng 7 số phía sau");
        }
        if(phone == ""){
            map.put("id","Cột này không được để trốnd");
        }
        String email = request.getParameter("email");
        if(!email.matches(EMAIL)){
            map.put("email","Định dạng đúng là inputsomething@gmail.com");
        }
        if(email == ""){
            map.put("email","Cột này không được để trốnd");
        }
        String address = request.getParameter("address");
        if(address == ""){
            map.put("address","Cột này không được để trốnd");
        }
        if (map.isEmpty()) {
            Customer customer = new Customer(id, typeId, name, birthday, gender, idCard, phone, email, address);
            customerRepo.create(customer);
        }

        return  map;
    }

    @Override
    public void edit(String id, Customer customer) {
        customerRepo.edit(id,customer);
    }

    @Override
    public void delete(String id) {
        customerRepo.delete(id);
    }

    @Override
    public List<Customer> search(String nameSearch, String typeCustomerId) {
        return customerRepo.search(nameSearch,typeCustomerId);
    }

//    @Override
//    public Customer findById(String id) {
//        return customerRepo.findById(id);
//    }
}
