import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletProduct", urlPatterns = "/discount")
public class ServletProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//            try{
                String productDescription = request.getParameter("product");
                double price= Double.parseDouble(request.getParameter("price"));
                double      discount= Double.parseDouble(request.getParameter("discount"));
                if (price >0 && discount>0) {

                    double discountAmount = price * discount * 0.01;
                    double discountPrice = price - discountAmount;
//                    PrintWriter printWriter = response.getWriter();
//
//                printWriter.println("<html>");
//
//                printWriter.println("<h1>Discount Amount: " + discountAmount + "<h1>");
//                printWriter.println("<h1>Discount Price: " + discountPrice + "<h1>");
//                printWriter.println("</html>");
                    request.setAttribute("Product",productDescription);
                    request.setAttribute("Price",price);
                    request.setAttribute("Discount",discount);
                    request.setAttribute("DiscountAmount",discountAmount);
                    request.setAttribute("Afterdiscount",discountPrice);
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }else {
                    request.getRequestDispatcher("negative.jsp").forward(request, response);
                }
//            }catch (Exception e){
//                    request.getRequestDispatcher("error.jsp").forward(request,response);
//            }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
