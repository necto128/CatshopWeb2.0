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

@WebServlet(name = "ServletUpdataCats")
public class ServletUpdataCats extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            updataCat(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void updataCat(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idCat"));
        String nameCat = request.getParameter("nameCat");
        int idDad = Integer.parseInt(request.getParameter("idDad"));
        int idMam = Integer.parseInt(request.getParameter("idMam"));
        Cat cat = new Cat(id, nameCat, idDad, idMam);
        CatDAO.updataCats(cat);
        response.sendRedirect(request.getContextPath() + "/ServletShow");
    }
}
