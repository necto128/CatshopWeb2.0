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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletDelete")
public class ServletDelete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        deleteCat(request, response);

    }

    private void deleteCat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCat = Integer.parseInt(request.getParameter("delete"));
        List<Cat> listcat = new ArrayList<>();
        listcat.add(CatDAO.searchCatsById(idCat));
        request.setAttribute("listcat", listcat);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShowDeleteCats.jsp");
        CatDAO.deleteRecord(idCat);
        dispatcher.forward(request, response);
    }
}
