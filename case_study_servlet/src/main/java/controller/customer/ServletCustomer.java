package controller.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import service.customer.impl.CustomerServiceImpl;
import service.customer.impl.TypeCustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletCustomer", urlPatterns = "/customers")
public class ServletCustomer extends HttpServlet {
    CustomerServiceImpl customerService=new CustomerServiceImpl();
    TypeCustomerServiceImpl typeCustomerService= new TypeCustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        if (action == null) {
            action="";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            default:showListCustomer(request,response);
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        if (action == null) {
            action="";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            case "edit":
                showFormEdit(request,response);
                break;
            case "delete":
                showFormDelete(request,response);
                break;
            case "search":
                showFormSearch(request,response);
                break;
            default:showListCustomer(request,response);
        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSearch");
        String id = request.getParameter("typeCustomerId");
        List<Customer> customers = customerService.search(name,id);
        List<CustomerType> types = typeCustomerService.findAll();
        request.setAttribute("types", types);
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/customer.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("id");
        customerService.delete(id);
        List<Customer> list= customerService.findAll();
        request.setAttribute("customers",list);
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/customer/customer.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        String id= request.getParameter("id");
        String typeId = request.getParameter("typeId");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int status = Integer.parseInt(request.getParameter("status"));

        Customer customer=new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address,status);
        customerService.edit(id,customer);
        List<Customer> customers= customerService.findAll();
        request.setAttribute("customers",customers);
        request.setAttribute("mess","Edit successful");
        try {
            request.getRequestDispatcher("view/customer/customer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("id",request.getParameter("id"));
        request.setAttribute("typeId",request.getParameter("typeId"));
        request.setAttribute("name",request.getParameter("name"));
        request.setAttribute("birthday",request.getParameter("birthday"));
        request.setAttribute("gender",request.getParameter("gender"));
        request.setAttribute("idCard",request.getParameter("idCard"));
        request.setAttribute("phone",request.getParameter("phone"));
        request.setAttribute("email",request.getParameter("email"));
        request.setAttribute("address",request.getParameter("address"));
//        int id = Integer.parseInt(request.getParameter("id"));
//        request.setAttribute("id",id);
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers= customerService.findAll();
        List<CustomerType> types = typeCustomerService.findAll();
        request.setAttribute("customers",customers);
        request.setAttribute("types", types);
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/customer/customer.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
//        if (customerService.findById(request.getParameter("id"))
//
//                != null){
//            request.setAttribute("mess","Id này đã tồn tại");
//            try {
//                request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }

        Map<String, String> validate = customerService.create(request,response);

        if (validate.isEmpty()){
            List<Customer> customers= customerService.findAll();
            List<CustomerType> types = typeCustomerService.findAll();
            request.setAttribute("customers",customers);
            request.setAttribute("types", types);
            RequestDispatcher dispatcher=request.getRequestDispatcher("view/customer/customer.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            List<Customer> customers= customerService.findAll();
            List<CustomerType> types = typeCustomerService.findAll();
            request.setAttribute("customers",customers);
            request.setAttribute("types", types);
            request.setAttribute("validate",validate);
            RequestDispatcher dispatcher=request.getRequestDispatcher("view/customer/create.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
