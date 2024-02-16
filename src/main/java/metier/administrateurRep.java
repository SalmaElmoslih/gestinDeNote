package metier;

import modele.Matiere;
import modele.administrateur;
import modele.etudiant;

public class administrateurRep extends rep<administrateur,String>{

	private EtudiantRep etudiantRep;
	private MatiereRep matiereRep;
	
		
	public administrateurRep() {
		super(administrateur.class);
		// TODO Auto-generated constructor stub
	}

	public administrateurRep(EtudiantRep etudiantRep) {		
		super(administrateur.class);	
		 this.etudiantRep = etudiantRep;
	}
	
	public administrateurRep(MatiereRep matiereRep) {		
		super(administrateur.class);	
		 this.matiereRep = matiereRep;
	}
	
	
	

	    public String ajouterEtudiant(etudiant etudiant) {
	    	etudiantRep.save(etudiant);
	        return "L'administrateur ajoute l'étudiant " + etudiant.getNom();
	    }
	    
	    public String ajouterMatiere(Matiere matiere) {
	    	matiereRep.save(matiere);
	        return "L'administrateur ajoute une matiere" ;
	    }
	    
	    

	    public String modifierEtudiant(etudiant etudiant) {
	    	etudiantRep.modify(etudiant);
	        return "L'administrateur a modifier l'étudiant " + etudiant.getNom();
	    }
	    
	    public String deleteEtudiant(etudiant etudiant) {
	    	etudiantRep.delete(etudiant);
	        return "L'administrateur a modifier l'étudiant " + etudiant.getNom();
	    }

	   

}
