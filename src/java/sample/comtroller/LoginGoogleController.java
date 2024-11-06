/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comtroller;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserGoogleDTO;
import sample.utils.Utils;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            String accessToken = Utils.getToken(code);
            UserGoogleDTO user = Utils.getUserInfo(accessToken);
            UserDAO dao = new UserDAO();
            Random rand = new Random();
            String userID = "";
            do {
                int num = rand.nextInt(1000);
                userID = "userGG" + num;
            } while (dao.checkDuplicate(userID));
            if (user != null) {
                UserDTO dto = new UserDTO(userID, user.getName(), "", "US", user.getEmail(), "", "");
                boolean checkValidation = true;
                UserDTO checkEmail = dao.checkEmail(user.getEmail());
                if (checkEmail != null) {
                    checkValidation = false;
                    request.setAttribute("ERROR", "Email already exist!");
                    url = ERROR;
                }
                if (checkValidation) {
                    boolean checkInsert = dao.insert(dto);
                    if (checkInsert) {
                        HttpSession session = request.getSession();
                        session.setAttribute("LOGIN_USER", dto);
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at LoginGoogleController " + e.toString());
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
