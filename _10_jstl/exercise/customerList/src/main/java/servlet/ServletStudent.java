package servlet;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletStudent", urlPatterns = "/customer")
public class ServletStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer[] customers= new Customer[4];
        customers[0]= new Customer("Long", "24/12/1997", "DN","https://media.istockphoto.com/photos/young-actress-reading-scenario-on-stage-in-theatre-picture-id1210331839?k=20&m=1210331839&s=612x612&w=0&h=vj7DSqvKhZ4YSHo8hyiF6PtoGI2LVK9FTxpEmjtOyYc=");
        customers[1]= new Customer("Linh", "24/12/1997", "DN","https://www.spiked-online.com/wp-content/uploads/2019/08/scarlett-johansson-1536x864.jpg");
        customers[2]= new Customer("Lan", "24/12/1997", "DN","https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg");
        customers[3]= new Customer("Khang", "24/12/1997", "DN","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ7Heib0AIVcgNsclkv6PqNgmwZJrFuSxVlA&usqp=CAU");
        request.setAttribute("listCustomer",customers);
        request.getRequestDispatcher("list_customer.jsp").forward(request,response);
    }
}
