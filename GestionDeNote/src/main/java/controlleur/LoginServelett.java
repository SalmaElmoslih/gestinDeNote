package controlleur;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import metier.personneRep;
import modele.Enseignant;
import modele.administrateur;
import modele.etudiant;
import modele.personne;


@WebServlet("/ctrll")
public class LoginServelett extends HttpServlet{
	
	personneRep personneRep = new personneRep();
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	    if (action == null) {
	        // Affichage de la liste par défaut
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	        
	    } 
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 	String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        personne user = personneRep.findByEmail(email);

	        // Vérifie si l'utilisateur existe et si le mot de passe correspond
	        if (user != null && user.getPassword().equals(password)) {
	            // Authentication successful
	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            
	            if (user instanceof Enseignant) {
	            	request.getRequestDispatcher("dashboardEnseignant.jsp").forward(request, response);
	            } else if (user instanceof etudiant) {
	                request.getRequestDispatcher("dashboardEtudiant.jsp").forward(request, response);
	            } else if (user instanceof administrateur) {
	            	  request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
	            } 
	            //response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
	            
	            
	        } else {
	            // Authentication failed
	            request.setAttribute("errorMessage", "Adresse e-mail ou mot de passe incorrect");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }
	}
}
