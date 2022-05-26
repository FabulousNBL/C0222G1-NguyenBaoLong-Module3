import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletProduct", value = "/discount")
public class ServletProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price= Double.parseDouble(request.getParameter("price1"));
        double discount= Double.parseDouble(request.getParameter("discount1"));
        

        double discountAmount= price*discount*0.01;
        double discountPrice= price-discountAmount;


        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>discountAmount: " + discountAmount + "</h1>");
        writer.println("<h1>discountPrice: " + discountPrice + "</h1>");
        writer.println("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
