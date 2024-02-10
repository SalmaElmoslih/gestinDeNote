package metier;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import modele.etudiant;

public class EtudiantRep extends rep<etudiant,String> {
	 
	public EtudiantRep() {
		super(etudiant.class);
		// TODO Auto-generated constructor stub
	}
}
