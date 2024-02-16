package controlleur;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import metier.EtudiantRep;
import metier.MatiereRep;
import metier.NoteRep;
import metier.personneRep;
import modele.Enseignant;
import modele.Matiere;
import modele.Notes;
import modele.administrateur;
import modele.etudiant;
import modele.personne;


@WebServlet("/ctrll")
public class LoginServelett extends HttpServlet{
	
	personneRep personneRep = new personneRep();
	EtudiantRep etudiantRep=new EtudiantRep();
	NoteRep  noteRep= new NoteRep();
	MatiereRep matiereRep= new MatiereRep();
	
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String action = request.getParameter("action");

	    personne user = personneRep.findByEmail(email);

	    if (user != null && user.getPassword().equals(password)) {
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);

	        if (user instanceof Enseignant) {
	            Enseignant enseignant = (Enseignant) user;
	            List<Matiere> matieres = matiereRep.findmatierByprof(enseignant);
	            session.setAttribute("enseignant", enseignant);
	            session.setAttribute("matieres", matieres);
	            request.getRequestDispatcher("dashboardEnseignant.jsp").forward(request, response);
	            
	        } else if (user instanceof etudiant) {
	            List<Notes> notes = (List<Notes>) noteRep.findnoteByetud(user);
	            HttpSession httpSession = request.getSession();
	            httpSession.setAttribute("listeNotes", notes);
	            request.getRequestDispatcher("dashboardEtudiant.jsp").forward(request, response);
	        } else if (user instanceof administrateur) {
	            request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
	        }
	    } else {
	        request.setAttribute("errorMessage", "Adresse e-mail ou mot de passe incorrect");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}

}
