package controller.service;

import model.customer.Customer;
import model.customer.CustomerType;
import model.service.RentType;
import model.service.Service;
import model.service.ServiceType;
import repository.service.impl.ServiceRepoImpl;
import repository.service.impl.ServiceTypeRepoImpl;
import service.serviceFurama.impl.RentTypeImpl;
import service.serviceFurama.impl.ServiceFuramaServiceImpl;
import service.serviceFurama.impl.ServiceTypeImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
        RentTypeImpl rentType= new RentTypeImpl();
        ServiceFuramaServiceImpl serviceFuramaService=new ServiceFuramaServiceImpl();
        ServiceTypeImpl serviceType= new ServiceTypeImpl();
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
//                edit(request,response);
                break;
            case "delete":
//                delete(request,response);
                break;
            default:
                showListService(request,response);
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            case "search":
                showFormSearch(request,response);
                break;
            default:
                showListService(request,response);

        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("services");
        int typeServiceId = Integer.parseInt(request.getParameter("types"));
        int idRentType = Integer.parseInt(request.getParameter("rentTypes"));
        List<Service> services = serviceFuramaService.search(name,typeServiceId,idRentType);
        List<ServiceType> types = serviceType.findAll();
        List<RentType> rentTypes= rentType.findAll();
        request.setAttribute("services", services);
        request.setAttribute("types", types);
        request.setAttribute("rentTypes", rentTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/service.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double area= Double.parseDouble(request.getParameter("area"));
        double rentCost= Double.parseDouble(request.getParameter("rentCost"));
        int maxCustomer= Integer.parseInt(request.getParameter("maxCustomer"));
        int rentTypeId= Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId= Integer.parseInt(request.getParameter("typeId"));
        String standardRoom=request.getParameter("standardRoom");
        String otherService=request.getParameter("otherService");
        double poolArea= Double.parseDouble(request.getParameter("poolArea"));
        int floorNumber=Integer.parseInt(request.getParameter("floorNumber"));

        Service service= new Service(id,name,area,rentCost,maxCustomer,rentTypeId,serviceTypeId,standardRoom,otherService,poolArea,floorNumber);
        serviceFuramaService.create(service);
        request.setAttribute("mess","Thêm mới thành công");
        try {
            request.getRequestDispatcher("view/service/service.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/service/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> list= serviceFuramaService.findAll();
        request.setAttribute("serviceList",list);
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/service/service.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
