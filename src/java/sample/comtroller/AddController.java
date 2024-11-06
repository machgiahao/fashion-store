/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comtroller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.ProductDAO;
import sample.shopping.Products;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR = "ViewDetailController";
    private static final String SUCCESS = "ViewDetailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ProductDAO dao = new ProductDAO();
            List<Products> list = dao.getAll();
            String productID = request.getParameter("productID");
            String name = request.getParameter("nameProduct");
            String price = request.getParameter("priceProduct");
            String img = request.getParameter("img");
            String quantityBuyStr = request.getParameter("quantityBuy");
            int quantityBuy = Integer.parseInt(quantityBuyStr);
            Products product = new Products(productID, name, Double.parseDouble(price), quantityBuy, img);
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            }
            boolean checkAdd = cart.add(product);
            if (checkAdd) {
                request.setAttribute("LIST_PRODUCT", list);
                session.setAttribute("CART", cart);
                request.setAttribute("MESSAGE", "You have successfully add " + name + " with quantity " + quantityBuy);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("error at AddController: " + e.toString());
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
