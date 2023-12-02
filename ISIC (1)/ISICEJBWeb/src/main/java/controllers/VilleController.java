package controllers;

import jakarta.annotation.security.PermitAll;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoVille;
import entities.Hotel;
import entities.Ville;

@WebServlet("/VilleController")
public class VilleController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private IDaoVille ejb1;

    public VilleController() {
        super();
    }

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action == null) {
        	// Your existing code for displaying the list of Ville
            request.setAttribute("villes", ejb1.findAll());
            ServletContext context = getServletContext();
            context.setAttribute("ejb1", ejb1);
	
		  
        RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");

        dispatcher.forward(request, response);
    }
        if (action.equals("edit")) {
            String villeId = request.getParameter("id");
            Ville editVille = ejb1.findById(Integer.parseInt(villeId));

            request.setAttribute("editVille", editVille);

            RequestDispatcher dispatcher = request.getRequestDispatcher("editVille.jsp");
            dispatcher.forward(request, response);
        } else {
            // Your existing code for displaying the list of Ville
            request.setAttribute("villes", ejb1.findAll());
            ServletContext context = getServletContext();
            context.setAttribute("ejb1",ejb1);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
            dispatcher.forward(request, response);
        }  {
            // Handle other cases or provide an error response if needed
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
    }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
String action = request.getParameter("action");
        
        if (action.equals("delete")) {
            String ville_id = request.getParameter("id");
            ejb1.delete(ejb1.findById(Integer.parseInt(ville_id)));
        } else if (action.equals("update")) {
            String ville_id = request.getParameter("id");
            Ville villeToUpdate = ejb1.findById(Integer.parseInt(ville_id));

            if (villeToUpdate != null) {
                String updatedNom = request.getParameter("ville");
                villeToUpdate.setNom(updatedNom);
                ejb1.update(villeToUpdate);
            }
        } else {
            String nom = request.getParameter("ville");
            ejb1.create(new Ville(nom));
        }
        
        doGet(request, response);
    }
}