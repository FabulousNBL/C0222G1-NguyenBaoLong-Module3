package controller;

import model.User;
import repository.IUserRepoImpl;
import service.IUserService;
import service.IUserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletUser", urlPatterns = "/users")
public class ServletUser extends HttpServlet {
    private IUserServiceImpl userService= new IUserServiceImpl();
    IUserRepoImpl userRepo= new IUserRepoImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            default:
                showListUser(request, response);
        }

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int status = Integer.parseInt(request.getParameter("status"));

        User user=new User(id,name,email,country,status);
        userService.update(id,user);
        List<User> users= userService.findAll();
        request.setAttribute("users",users);
        request.setAttribute("mess","update successful");
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int status = Integer.parseInt(request.getParameter("status"));
        User user = new User(name,email,country,status);
        userRepo.save(user);
        request.setAttribute("mess","them moi thanh cong");
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showFormDelete(request,response);
                break;
            default:
                showListUser(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
       request.setAttribute("id",request.getParameter("id"));
       request.setAttribute("name",request.getParameter("name"));
       request.setAttribute("email",request.getParameter("email"));
       request.setAttribute("country",request.getParameter("country"));
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher= request.getRequestDispatcher("view/create.jsp");
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
        userService.delete(id);

        List<User>list=userService.findAll();
        request.setAttribute("users",list);
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users= userService.findAll();
        request.setAttribute("users",users);
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
