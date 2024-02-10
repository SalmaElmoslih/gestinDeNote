package controlleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import metier.rep;
import modele.Enseignant;
import modele.administrateur;
import modele.etudiant;
import modele.personne;

import java.io.IOException;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Récupérer les informations d'identification soumises par l'utilisateur
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Vérifier les informations d'identification dans la base de données
        personne personne= authenticate(email, password);
        
        if (personne != null) {
            // Authentification réussie, rediriger vers la page appropriée en fonction du rôle
            HttpSession session = request.getSession();
            session.setAttribute("personne", personne);
            
            // Redirection en fonction du rôle
            if (personne instanceof administrateur) {
                request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
            } else if (personne instanceof Enseignant) {
                response.sendRedirect(request.getContextPath() + "/dashboardEnseignant.jsp");
            } else if (personne instanceof etudiant) {
                response.sendRedirect(request.getContextPath() + "/dashboardEtudiant.jsp");
            }
        } else {
            // Authentification échouée, afficher un message d'erreur
            request.setAttribute("errorMessage", "Identifiants incorrects");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
	}
        private personne authenticate(String email, String password) {
        	rep<personne, String> personneRep = new rep<>(personne.class);

            // Récupérer la personne par son email (supposant que l'email est unique dans la base de données)
            personne user = personneRep.findByEmail(email);

            // Vérifier si l'utilisateur existe et si le mot de passe correspond
            if (user != null && user.getPassword().equals(password)) {
                return user;
            } else {
                return null; // Authentification échouée
            }
            
        }

	

}
