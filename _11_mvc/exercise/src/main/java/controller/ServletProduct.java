package controller;

import model.Product;
import service.productImpl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletProduct", urlPatterns = "/product")
public class ServletProduct extends HttpServlet {
    private ProductServiceImpl productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "update":
                update(request,response);
                break;
            default:
                showProductList(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showCreateForm(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "view":
                showFormView(request,response);
                break;
            case "search":
                showFormSearch(request,response);
                break;
            case "update":
                showFormUpdate(request,response);
                break;
            default:
                showProductList(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        Product product = new Product(id, name, price);
        Map<String, String> map = productService.save(product);

        if (map.isEmpty()) {
            request.setAttribute("mess", "Th??m m???i th??nh c??ng");
        } else {
            request.setAttribute("mess", "Th??m m???i kh??ng th??nh c??ng");
            request.setAttribute("error", map);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.findAll();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product= this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product==null){
            dispatcher= request.getRequestDispatcher("view/error-404.jsp");
        }else {
            this.productService.delete(id);
        }
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product= this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null){
            dispatcher= request.getRequestDispatcher("view/error-404.jsp");
        }else {
            request.setAttribute("product",product);
            dispatcher= request.getRequestDispatcher("view/product/delete.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void  showFormView(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product= this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product==null){
            dispatcher= request.getRequestDispatcher("view/error-404.jsp");
        }else {
            request.setAttribute("product",product);
            dispatcher=request.getRequestDispatcher("/view/product/view.jsp");
        }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response){
       String name = request.getParameter("name");
       List<Product> productList= this.productService.searchByName(name);
       request.setAttribute("products",productList);
        try {
            request.getRequestDispatcher("view/product/search.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response){
       int id= Integer.parseInt(request.getParameter("id"));
       String name= request.getParameter("name");
       double price= Double.parseDouble(request.getParameter("price"));

       Product product= this.productService.findById(id);

       RequestDispatcher dispatcher;
       if (product==null){
           dispatcher= request.getRequestDispatcher("/error-404.jsp");
       }else {
           product.setId(id);
           product.setName(name);
           product.setPrice(price);
           productService.update(id,product);
           request.setAttribute("product",product);
           request.setAttribute("mess","update successful");

           try {
               request.getRequestDispatcher("view/product/update.jsp").forward(request,response);
           } catch (ServletException e) {
               e.printStackTrace();
           } catch (IOException e) {
               e.printStackTrace();
           }
       }


    }


    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product= this.productService.findById(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("view/product/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
