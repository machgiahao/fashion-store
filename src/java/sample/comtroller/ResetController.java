/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comtroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserError;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ResetController", urlPatterns = {"/ResetController"})
public class ResetController extends HttpServlet {

    private static final String SUCCESS = "resetPassword.jsp";
    private static final String ERROR = "resetPassword.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        UserError userError = new UserError();
        try {
            boolean checkValidation = true;
            UserDAO dao = new UserDAO();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            if (!confirm.equals(password)) {
                checkValidation = false;
                userError.setConfirmError("Repassword does not match!");
            }
            if (checkValidation) {
                boolean checkReset = dao.resetPassword(password, email);
                if (checkReset) {
                    request.setAttribute("SUCCESS", "Reset password successfully!");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Cannot reset password!");
                    url = ERROR;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at ResetController: " + e.toString());
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
