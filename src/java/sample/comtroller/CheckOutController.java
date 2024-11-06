/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comtroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.OrderDAO;
import sample.shopping.ProductDAO;
import sample.shopping.Products;
import sample.user.UserDTO;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean check = true;
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            ProductDAO productDAO = new ProductDAO();
            OrderDAO orderDAO = new OrderDAO();
            if (user == null) {
                request.setAttribute("ERROR_MESSAGE", "You are not login!");
                url = ERROR;
            } else {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    request.setAttribute("ERROR_MESSAGE", "Cart is currently empty!");
                    url = SUCCESS;
                } else {
                    Map<String, String> errorMap = new HashMap<>();
                    for (Products product : cart.getCart().values()) {
                        Products p = productDAO.getByID(product.getProductID());
                        if (p.getQuantity() < product.getQuantity()) {
                            errorMap.put(p.getProductID() , "The quantity of " + p.getProductID() + " in stock is not enough!");
                            check = false;
                            url = ERROR;
                        }
                    }
                    request.setAttribute("ERROR_MAP" , errorMap);
                    if (check) {
                        orderDAO.add(user, cart);
                        productDAO.updateQuantity(cart);
                        session.setAttribute("CART", null);
                        request.setAttribute("ERROR_MESSAGE", "Payment success!");
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckOutController : " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
