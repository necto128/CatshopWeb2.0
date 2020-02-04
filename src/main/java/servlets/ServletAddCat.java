package servlets;

import dao.CatDAO;
import model.Cat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServletAddCat")
public class ServletAddCat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            addCat(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    private void addCat(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String nameCat = request.getParameter("nameCat");
        int idDad = Integer.parseInt(request.getParameter("idDad"));
        int idMam = Integer.parseInt(request.getParameter("idMam"));
        String gender = request.getParameter("gender");
        Cat cat = new Cat(nameCat, idDad, idMam, gender);
        CatDAO.addRecords(cat);
        response.sendRedirect(request.getContextPath() + "/ServletShow");
    }
}

