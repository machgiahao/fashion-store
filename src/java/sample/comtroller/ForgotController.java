/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comtroller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.utils.ResetService;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ForgotController", urlPatterns = {"/ForgotController"})
public class ForgotController extends HttpServlet {

    private static final String SUCCESS = "forgot.jsp";
    private static final String ERROR = "forgot.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            UserDAO dao = new UserDAO();
            UserDTO checkEmail = dao.checkEmail(email);
            if (checkEmail != null) {
                String linkReset = "http://localhost:8080/UserManagement?action=Reset_Page&email=" + email;
                ResetService service = new ResetService();
                boolean checkSend = service.sendEmail(email, linkReset, checkEmail.getFullName());
                if (!checkSend) {
                    request.setAttribute("EMAIL_ERROR", "Can not send request!");
                } else {
                    request.setAttribute("EMAIL_ERROR", "Please check your email!");
                }
                url = SUCCESS;
            } else {
                request.setAttribute("EMAIL_ERROR", "Email does not exist!");
            }

        } catch (SQLException e) {
            log("Error at ForgotController: " + e.toString());
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ForgotController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ForgotController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
