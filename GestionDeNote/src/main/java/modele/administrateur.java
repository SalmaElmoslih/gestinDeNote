package modele;

import javax.persistence.Entity;



@Entity
public class administrateur extends personne {
	public static final String ROLE_ADMIN = "ADMIN";
	String Poste;
	
	public administrateur(String nom, String prenom, String cIN, int age, String email, String password, String Poste) {
		super(nom, prenom, cIN, age, email, password);
		this.Poste=Poste;
		this.role = ROLE_ADMIN;
		
	}

	 @Override
	    public void consulterNotes(Matiere matiere, etudiant etudiant) {
	        System.out.println("L'administrateur consulte les notes pour la matière " + matiere);
	    }

	@Override
	public String toString() {
		return "administrateur [Poste=" + Poste + ", CIN=" + CIN + ", nom=" + nom + ", prenom=" + prenom + ", age="
				+ age + ", email=" + email + ", password=" + password + "]";
	}

	

}
