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

@WebServlet(name = "ServletCheck")
public class ServletCheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            checkCat(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    private void checkCat(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("check"));
        Cat cat = new Cat(id);
        List<Cat> listcat = CatDAO.searchCatsById(cat);
        List<Cat> listcats = CatDAO.dataOutput();
        request.setAttribute("listcat", listcat);
        request.setAttribute("listcats", listcats);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShowCat.jsp");
        dispatcher.forward(request, response);
    }
}
