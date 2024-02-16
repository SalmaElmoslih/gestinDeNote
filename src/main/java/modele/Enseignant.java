package modele;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import metier.NoteRep;

@Entity
public class Enseignant extends personne {
	
	public static final String ROLE_ENSEIGNANT = "ENSEIGNANT";
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "enseignant")
    private List<Notes> notes = new ArrayList<>();
	
	//@OneToMany(cascade = CascadeType.ALL)
    //@JoinColumn(name = "enseignant_id")
    //private List<Matiere> matieres = new ArrayList<>();
	
	
	public Enseignant(String nom, String prenom, String cIN, int age, String email, String password) {
        super(nom, prenom, cIN, age, email, password);
        this.role = ROLE_ENSEIGNANT;
      
    }
    
    

    
   
    /*public String ajouterNote(NoteRep noteRep,etudiant etd, Matiere matiere, double note) {   	
        Notes nouvelleNote = new Notes(etd, matiere, note, this);
        noteRep.save(nouvelleNote);
        return "note ajouter " +getNotes();
    }*/

  


    public Enseignant() {
		super();
		// TODO Auto-generated constructor stub
	}





	@Override
    public void consulterNotes(Matiere matiere, etudiant etudiant) {
if (matiere != null && etudiant == null) {
            
            System.out.println("Notes pour la matière " + matiere.getNomMatiere() + ":");
        } else if (matiere == null && etudiant != null) {

            System.out.println("Notes pour l'étudiant " + etudiant.getNom() + " " + etudiant.getPrenom() + ":");
        } else {
            System.out.println("Veuillez spécifier soit une matière, soit un étudiant.");
        }
    }
}
