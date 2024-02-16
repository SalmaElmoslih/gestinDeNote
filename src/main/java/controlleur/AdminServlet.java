package controlleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import metier.EnseignantRep;
import metier.EtudiantRep;
import metier.MatiereRep;
import metier.ModuleRep;
import modele.Enseignant;
import modele.Matiere;
import modele.Modules;
import modele.Notes;
import modele.etudiant;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	
	EtudiantRep etdRep = new EtudiantRep();
	EnseignantRep enseignantRep = new EnseignantRep();
	MatiereRep matiereRep = new MatiereRep();
	ModuleRep moduleRep = new ModuleRep();
	Modules module = new Modules();
	
       @Override
    public void init() throws ServletException {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
		 
		    if (action.equalsIgnoreCase("ajouterEtd")) {
		        // Affichage de la liste par défaut
		        request.getRequestDispatcher("ajouterEtd.jsp").forward(request, response);	        
		    }
		    
		    else if(action.equalsIgnoreCase("ajouterEnseigant")){
		    	 request.getRequestDispatcher("ajouterEnseignant.jsp").forward(request, response);	
		    }

		    else if(action.equalsIgnoreCase("ajouterMatiere")){
		    	
		    	//List<Enseignant> enseignants = ensegntRep.findAll();
                List<Modules> modules = moduleRep.findAll();
                //request.setAttribute("enseignants", enseignants);
		    	List<Enseignant> enseignants = enseignantRep.findAll();
		    	HttpSession httpSession = request.getSession();
		    	httpSession.setAttribute("enseignants", enseignants);
		    	httpSession.setAttribute("modules", modules);
		    	
                request.getRequestDispatcher("ajouterMatiere.jsp").forward(request, response);	
		    }
		    
		    else if(action.equalsIgnoreCase("afficherEtudiant")) {
		    	
				 etudiant etudiant = (etudiant)request.getSession().getAttribute("etudiant");
				 List<etudiant> etd = (List<etudiant>) etdRep.findAll();
		         HttpSession httpSession = request.getSession();
		         httpSession.setAttribute("liste", etd);
		    	 request.getRequestDispatcher("afficherEtudiant.jsp").forward(request, response);
	        }
		    
		    else if(action.equalsIgnoreCase("modifier_Etd")) {
		    	
		        String idParameter = request.getParameter("id_M");
		        etudiant etudiantToModify = etdRep.findById(idParameter);

		       
		        request.setAttribute("etudiant", etudiantToModify);
				request.getRequestDispatcher("modifier_Etd.jsp").forward(request, response);
			}
		    
	        else if(action.equalsIgnoreCase("delete_Etd")){

				String idParameter = request.getParameter("id_S");
		        //etudiant etudiantToDelete = etdRep.findById(idParameter);
		        etdRep.deleteById(idParameter);
		        response.sendRedirect("admin?action=afficherEtudiant");
			}
		    
	        else if(action.equalsIgnoreCase("afficherMatiere")) {
		    	
				 Matiere matiere = (Matiere)request.getSession().getAttribute("matiere");
				 List<Matiere> matier = (List<Matiere>) matiereRep.findAll();
		         HttpSession httpSession = request.getSession();
		         httpSession.setAttribute("liste", matier);
		    	 request.getRequestDispatcher("afficherMatiere.jsp").forward(request, response);
	        } 
		    
	        else if(action.equalsIgnoreCase("delete_Matiere")){

				int idParameter = Integer.parseInt(request.getParameter("id_S")) ;
		        //etudiant etudiantToDelete = etdRep.findById(idParameter);
		        matiereRep.deleteById(idParameter);
		        response.sendRedirect("admin?action=afficherMatiere");
			}
		    
	        else if(action.equalsIgnoreCase("modifier_matiere")) {
		    	
	        	int idParameter = Integer.parseInt(request.getParameter("id_M")) ;
		        Matiere MatiereToModify = matiereRep.findById(idParameter);
	        	request.setAttribute("matiere", MatiereToModify);

				//List<Enseignant> enseignants = ensegntRep.findAll();
				List<Modules> modules = moduleRep.findAll();
				//request.setAttribute("enseignants", enseignants);
				List<Enseignant> enseignants = enseignantRep.findAll();
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("enseignants", enseignants);
				httpSession.setAttribute("modules", modules);
				request.getRequestDispatcher("modifier_matiere.jsp").forward(request, response);
			}
		    
	        else if(action.equalsIgnoreCase("afficherEnseignant")) {
		    	
				 Enseignant enseignant = (Enseignant)request.getSession().getAttribute("enseignant");
				 List<Enseignant> enseignantt = (List<Enseignant>) enseignantRep.findAll();
		         HttpSession httpSession = request.getSession();
		         httpSession.setAttribute("liste", enseignantt);
		    	 request.getRequestDispatcher("afficherEnseignant.jsp").forward(request, response);
	        }
        	else if(action.equalsIgnoreCase("modifier_enseignant")) {
		    	
		        String idParameter = request.getParameter("id_M");
		        Enseignant enseignantToModify = enseignantRep.findById(idParameter);

		       
		        request.setAttribute("Enseignant", enseignantToModify);
				request.getRequestDispatcher("modifier_enseignant.jsp").forward(request, response);
			}
		    
	        else if(action.equalsIgnoreCase("delete_enseignant")){

				String idParameter = request.getParameter("id_S");
		        //etudiant etudiantToDelete = etdRep.findById(idParameter);
				enseignantRep.deleteById(idParameter);
		        response.sendRedirect("admin?action=afficherEnseignant");
			}
		    
	}
	
	private void doAjouterEtd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String CIN = request.getParameter("CIN");
		String CNE = request.getParameter("CNE");
		String email = request.getParameter("email");
		String mdps = request.getParameter("mdps");
		String role = request.getParameter("role");
		int age = Integer.parseInt(request.getParameter("age"));
  	   

  	    etudiant etd = new etudiant();
  	    
  	    etd.setNom(nom); 
  	    etd.setPrenom(prenom);
  	    etd.setCIN(CIN);
  	    etd.setCNE(CNE);
  	    etd.setEmail(email);
  	    etd.setPassword(mdps);
  	    etd.setAge(age);
  	    
  	    
  	    request.setAttribute("etd", etd);
  	    etdRep.save(etd);

  	    request.getRequestDispatcher("detailEtd.jsp").forward(request, response);
	}

	private void doAjouterEnseignant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String CIN = request.getParameter("CIN");
		String email = request.getParameter("email");
		String mdps = request.getParameter("mdps");
  	   

  	    Enseignant ensgt = new Enseignant();
  	    
  	    ensgt.setNom(nom); 
	  	ensgt.setPrenom(prenom);
	  	ensgt.setCIN(CIN);
	  	ensgt.setEmail(email);
	  	ensgt.setPassword(mdps);
  	    
  	    request.setAttribute("etd", ensgt);
  	    enseignantRep.save(ensgt);

  	    request.getRequestDispatcher("detailEnseignant.jsp").forward(request, response);
	}
	
private void doAjouterMatiere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");
		String controlle = request.getParameter("controlle");
		String rattrapage = request.getParameter("rattrapage");
		String cinEnseignant = request.getParameter("enseignant");
		int idModule = Integer.parseInt(request.getParameter("module"));
		
	
	 	Matiere matiere = new Matiere();
	    matiere.setNom(nom);
	    matiere.setControlle(controlle);
	    matiere.setDate_ratt(rattrapage);

	    
	    Enseignant enseignant = enseignantRep.findById(cinEnseignant);		    
	    matiere.setEnseignant(enseignant);
	    
	    Modules modules = moduleRep.findById(idModule);		    
	    matiere.setModule(modules);
  
  	    request.setAttribute("matiere", matiere);
  	    matiereRep.save(matiere);

  	    request.getRequestDispatcher("detailMatiere.jsp").forward(request, response);
	}


private void doModifietEtd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String idParameter = request.getParameter("id_M");
    etudiant etudiantToModify = etdRep.findById(idParameter);

    // Vérifier si l'étudiant à modifier existe
    if (etudiantToModify == null) {
        // Gérer le cas où l'étudiant n'existe pas
        response.getWriter().write("L'étudiant à modifier n'existe pas.");
        return;
    }

    // Récupérer les nouvelles valeurs à partir du formulaire
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String CNE = request.getParameter("CNE");
    String email = request.getParameter("email");
    String mdps = request.getParameter("mdps");
    int age = Integer.parseInt(request.getParameter("age"));

    // Mettre à jour les informations de l'étudiant
    etudiantToModify.setNom(nom); 
    etudiantToModify.setPrenom(prenom);
    etudiantToModify.setCNE(CNE);
    etudiantToModify.setEmail(email);
    etudiantToModify.setPassword(mdps);
    etudiantToModify.setAge(age);

    // Modifier l'étudiant dans la base de données
    etdRep.modify(etudiantToModify);

    // Rediriger vers une page de confirmation ou d'affichage des étudiants
    response.sendRedirect("admin?action=afficherEtudiant");
}

private void doModifierMatiere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int idParameter = Integer.parseInt(request.getParameter("id_M")) ;
    Matiere MatiereToModify = matiereRep.findById(idParameter);
	
	String nom = request.getParameter("nom");
	String controlle = request.getParameter("controlle");
	String rattrapage = request.getParameter("rattrapage");
	String cinEnseignant = request.getParameter("enseignant");
	int idModule = Integer.parseInt(request.getParameter("module"));
	

	MatiereToModify.setNom(nom);
	MatiereToModify.setControlle(controlle);
	MatiereToModify.setDate_ratt(rattrapage);

    
    Enseignant enseignant = enseignantRep.findById(cinEnseignant);		    
    MatiereToModify.setEnseignant(enseignant);
    
    Modules modules = moduleRep.findById(idModule);		    
    MatiereToModify.setModule(modules);

	    request.setAttribute("MatiereToModify", MatiereToModify);
	    matiereRep.modify(MatiereToModify);

	    request.getRequestDispatcher("admin?action=afficherMatiere").forward(request, response);
}

private void doModifietEnseignant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String idParameter = request.getParameter("id_M");
    Enseignant etudiantToModify = enseignantRep.findById(idParameter);

    // Vérifier si l'étudiant à modifier existe
    if (etudiantToModify == null) {
        // Gérer le cas où l'étudiant n'existe pas
        response.getWriter().write("L'énseignant à modifier n'existe pas.");
        return;
    }

    // Récupérer les nouvelles valeurs à partir du formulaire
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String CNE = request.getParameter("CNE");
    String email = request.getParameter("email");
    String mdps = request.getParameter("mdps");
    int age = Integer.parseInt(request.getParameter("age"));

    // Mettre à jour les informations de l'étudiant
    etudiantToModify.setNom(nom); 
    etudiantToModify.setPrenom(prenom);
    etudiantToModify.setEmail(email);
    etudiantToModify.setPassword(mdps);
    etudiantToModify.setAge(age);

    // Modifier l'étudiant dans la base de données
    enseignantRep.modify(etudiantToModify);

    // Rediriger vers une page de confirmation ou d'affichage des étudiants
    response.sendRedirect("admin?action=afficherEnseignant");
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	       
        switch (action) {
            case "ajouterEtd":
                try {
                	doAjouterEtd(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().write("Error during ajout etudiant: " + e.getMessage());
                }
                break;
            case "ajouterEnseigant":
                try {
                	doAjouterEnseignant(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().write("Error during ajout enseignant: " + e.getMessage());
                }
                break;
            case "ajouterMatiere":
                try {
                	doAjouterMatiere(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().write("Error during ajout matiere: " + e.getMessage());
                }
                break;
            case "modifier_Etd":
                try {
                	doModifietEtd(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().write("Error during modifier etudiant: " + e.getMessage());
                }
                break;
            case "modifier_matiere": 
                try {
                    doModifierMatiere(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().write("Error during modifier matiere: " + e.getMessage());
                }
                break;
            case "modifier_enseignant": 
                try {
                	doModifietEnseignant(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().write("Error during modifier matiere: " + e.getMessage());
                }
                break;
            default:
            	request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
        }
		
	}

}