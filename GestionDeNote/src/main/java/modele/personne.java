package modele;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class personne {
    @Id
    
    protected String CIN;
    protected String nom;
    protected String prenom;   
    protected int age;
    protected String  email;
    protected String password;
    protected String role;

    public abstract void consulterNotes(Matiere matiere, etudiant etudiant);
 
    // Constructeur par défaut
    public personne() {
        // Initialisation par défaut ou laisser vide si aucune initialisation n'est nécessaire
    }



	
	public personne(String nom, String prenom, String cIN, int age, String email, String password) {
		this.nom = nom;
		this.prenom = prenom;
		this.CIN = cIN;
		this.age = age;
		this.email = email;
		this.password = password;
		
	}




	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}




	public String getCIN() {
		return CIN;
	}




	public void setCIN(String cIN) {
		CIN = cIN;
	}




	public int getAge() {
		return age;
	}




	public void setAge(int age) {
		this.age = age;
	}
	
	
	

}
