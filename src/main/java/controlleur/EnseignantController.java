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
import modele.Enseignant;
import modele.Matiere;
import modele.Notes;
import modele.etudiant;

@WebServlet("/enseignant")
public class EnseignantController extends HttpServlet {
	EtudiantRep etudiantRep =new EtudiantRep();
	MatiereRep matiereRep= new MatiereRep();
	NoteRep noteRep= new NoteRep();	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("ajouterNote")) {
	    	 List<etudiant> etudiants = etudiantRep.findAll(); 
	         HttpSession session = request.getSession();
	         session.setAttribute("etudiants", etudiants);
	         request.getRequestDispatcher("ajouterNote.jsp").forward(request, response);
		}else if(action.equalsIgnoreCase("afficherNote")) {
			 Enseignant enseignant = (Enseignant)request.getSession().getAttribute("enseignant");
			 List<Notes> notes = (List<Notes>) noteRep.findnoteByprof(enseignant);
	         HttpSession httpSession = request.getSession();
	         httpSession.setAttribute("liste", notes);
	    	 request.getRequestDispatcher("afficherNote.jsp").forward(request, response);
        }else if(action.equalsIgnoreCase("formulaire_MJ_Note")) {
			request.getRequestDispatcher("formulaire_MJ_Note.jsp").forward(request, response);
		}
        else if(action.equalsIgnoreCase("delete_note")){

			String idParameter = request.getParameter("id_S");
			Long id = Long.parseLong(idParameter);	
			noteRep.deleteById(id);
			Enseignant enseignant = (Enseignant)request.getSession().getAttribute("enseignant");
			List<Notes> notes = (List<Notes>) noteRep.findnoteByprof(enseignant);
	        HttpSession httpSession = request.getSession();
	        httpSession.setAttribute("liste", notes);
	    	request.getRequestDispatcher("afficherNote.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("ajouterNote")) {
	    	Enseignant enseignant = (Enseignant)request.getSession().getAttribute("enseignant");
            Notes notes = new Notes();
            Integer id_matiere = Integer.parseInt(request.getParameter("matiere"));
            Matiere matiere = matiereRep.findById(id_matiere);
            notes.setMatiere(matiere);
            String cin = request.getParameter("etudiant");
            etudiant e1 = etudiantRep.findById(cin);
            notes.setEtudiant(e1);
            Double note = Double.parseDouble(request.getParameter("note"));
            notes.setNote(note);
            notes.setEnseignant(enseignant);
            noteRep.save(notes);
			request.getRequestDispatcher("dashboardEnseignant.jsp").forward(request, response);
        }else if(action.equalsIgnoreCase("formulaire_MJ_Note")) {
			String idParameter = request.getParameter("id_M");
			Long id = Long.parseLong(idParameter);	
			Notes notes= noteRep.findById(id);
            Double note = Double.parseDouble(request.getParameter("note_m"));
            notes.setNote(note);
            noteRep.modify(notes);;
			
            request.getRequestDispatcher("dashboardEnseignant.jsp").forward(request, response);
		}
	}

}
