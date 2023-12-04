
package controllers;

import java.io.IOException;
import java.util.List;

import dao.IDaoHotel;
import dao.IDaoLocale;
import dao.IDaoVille;
import entities.Hotel;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


	public class HotelController extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		@EJB
		private IDaoHotel ejb;
		@EJB
	    private IDaoVille ejb1;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public HotelController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		@PermitAll
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String nom = request.getParameter("nom");
	        String adresse = request.getParameter("adresse");
	        String telephone = request.getParameter("telephone");

	        ejb.create(new Hotel(nom, adresse, telephone));

	        // Récupérer la liste des villes depuis ejb1
	        List<Ville> villes = ejb1.findAll(); // Assurez-vous que la méthode findAll() est correctement implémentée

	        // Ajouter la liste des villes à l'objet de la requête
	        request.setAttribute("Villes", villes);

	        request.setAttribute("Hotels", ejb.findAll());
	        RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");

	        dispatcher.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        doGet(request, response);
	        // Aucun besoin de récupérer la liste des villes ici
	    }
	  



	}
