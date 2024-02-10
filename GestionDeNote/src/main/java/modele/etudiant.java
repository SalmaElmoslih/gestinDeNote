package modele;

import java.util.*;

import javax.persistence.*;

@Entity

public class etudiant extends personne {
	 @Column
    private String CNE;
	 @ManyToMany
	    @JoinTable(
	        name = "ETUDIANT_MATIERE_NOTE",
	        joinColumns = @JoinColumn(name = "ETUDIANT_ID"),
	        inverseJoinColumns = @JoinColumn(name = "MATIERE_ID")
	    )
	  private Set<Notes> notes = new HashSet<>();
    
    public etudiant(String nom, String prenom, String cIN, int age, String email, String password,String CNE) {
		super(nom, prenom, cIN, age, email, password);
		// TODO Auto-generated constructor stub
		this.CNE=CNE;
	}
    
    public String getCNE() {
		return CNE;
	}

	public void setCNE(String cNE) {
		CNE = cNE;
	}
	
/*
	public Set<Notes> getNotes() {
        return notes;
    }

	public void setNotes(Set<Notes> notes) {
    	this.notes = notes;
    }
    public void addNote(Notes note) {
        this.notes.add(note);
        note.getEtudiants().add(this); 
    }
    public void removeNote(Notes note) {
        this.notes.remove(note);
        note.getEtudiants().remove(this); // Bidirectional relationship
    }*/
	
	@Override
	public void consulterNotes(Matiere matiere, etudiant etudiant) {
		// TODO Auto-generated method stub
		
	}

    // getters and setters
	
	 @Override
	    public String toString() {
	        return "Etudiant { " +
	               "CNE='" + CNE + '\'' +
	               ", nom='" + nom + '\'' +
	               ", prenom='" + prenom + '\'' +
	               ", CIN='" + CIN + '\'' +
	               ", age=" + age +
	               ", email='" + email + '\'' +
	               ", password='" + password + '\'' +
	               " }";
	    }
}
