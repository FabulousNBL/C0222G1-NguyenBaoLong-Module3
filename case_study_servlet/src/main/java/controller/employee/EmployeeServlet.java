package controller.employee;

import model.employee.Employee;
import model.employee.User;
import service.employee.impl.EmployeeServiceImpl;
import service.employee.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeServiceImpl employeeService= new EmployeeServiceImpl();
    UserServiceImpl userService= new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            default:
                showListEmployee(request,response);
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
            case "delete":
                showFormDelete(request,response);
                break;
            case "edit":
                showFormEdit(request,response);
                break;
            case "search":
                showFormSearch(request,response);
                break;
            default:
                showListEmployee(request,response);
        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String address= request.getParameter("address");
        List<Employee> employeeList= employeeService.search(name,address);
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/employee/employee.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String cardId = request.getParameter("cardId");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int degreeId = Integer.parseInt(request.getParameter("degreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        int status = Integer.parseInt(request.getParameter("status"));

        Employee employee= new Employee(id,name,birthday,cardId,salary,phone,email,address,positionId,degreeId,divisionId,userName,status);
        employeeService.edit(id, employee);
        List<Employee> employeeList = employeeService.findALl();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("mess","Edit successful");
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("id",request.getParameter("id"));
        request.setAttribute("name",request.getParameter("name"));
        request.setAttribute("birthday",request.getParameter("birthday"));
        request.setAttribute("cardId",request.getParameter("cardId"));
        request.setAttribute("salary",request.getParameter("salary"));
        request.setAttribute("phone",request.getParameter("phone"));
        request.setAttribute("email",request.getParameter("email"));
        request.setAttribute("address",request.getParameter("address"));
        request.setAttribute("positionId",request.getParameter("positionId"));
        request.setAttribute("degreeId",request.getParameter("degreeId"));
        request.setAttribute("divisionId",request.getParameter("divisionId"));
        request.setAttribute("userName",request.getParameter("userName"));
        request.setAttribute("status",request.getParameter("status"));



        RequestDispatcher dispatcher= request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id);
        List<Employee> employeeList= employeeService.findALl();
        request.setAttribute("employeeList",employeeList);
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/employee/employee.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String cardId= request.getParameter("cardId");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email= request.getParameter("email");
        String address= request.getParameter("address");
        int positionId= Integer.parseInt(request.getParameter("positionId"));
        int degreeId= Integer.parseInt(request.getParameter("degreeId"));
        int divisionId= Integer.parseInt(request.getParameter("divisionId"));
        String userName= request.getParameter("userName");
        String password= request.getParameter("password");

        Employee employee= new Employee(name,birthday,cardId,salary,phone,email,address,positionId,degreeId,divisionId,userName);
        User user= new User(userName,password);
        userService.create(user);
        employeeService.create(employee);
        request.setAttribute("mess","Create successful");
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/employee/employee.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/employee/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> list= employeeService.findALl();
        request.setAttribute("employeeList",list);
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/employee/employee.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
