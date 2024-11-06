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
import sample.shopping.ProductDAO;
import sample.shopping.Products;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "GetAllController", urlPatterns = {"/GetAllController"})
public class GetAllController extends HttpServlet {

    private static final String SHOPPING_PAGE_VIEW = "shopping.jsp"; 
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            ProductDAO dao = new ProductDAO();
            List<Products> list1 = dao.getAll();
            int page, numperpage=8;
            int size = list1.size();
            int num = (size%numperpage==0?(size/numperpage) : ((size/6)+1));
            String xpage = request.getParameter("page");
            if(xpage==null){
                page=1;
            } else {
                page=Integer.parseInt(xpage);
            }
            int start = (page-1)*numperpage;
            int end = Math.min(page*numperpage, size);
            List<Products> list = dao.getListByPage(list1, start, end);
            
            request.setAttribute("PAGE", page);
            request.setAttribute("NUMBER_PAGE", num);
            request.setAttribute("LIST_BY_PAGE", list);                      
        } catch (Exception e) {
            log("Error at GetAllController: " + e.toString());
        }finally{
            request.getRequestDispatcher(SHOPPING_PAGE_VIEW).forward(request, response);
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












