package modele;
import javax.persistence.*;
@Entity
public class Notes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double note;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MATIERE_ID")
    private Matiere matiere;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ETUDIANT_ID")
    private etudiant etudiant;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ENSEIGNANT_ID")
    private Enseignant enseignant;

    // Constructors

    public Notes() {
    }

    public Notes(etudiant etd, Matiere matiere,double note,Enseignant enseignant) {
        this.note = note;
        this.matiere = matiere;
        this.etudiant = etd;
        this.enseignant= enseignant;
       
    }

    // Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getNote() {
        return note;
    }

    public void setNote(double note) {
        this.note = note;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    public etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }

	@Override
	public String toString() {
		return "Notes [id=" + id + ", note=" + note + ", matiere=" + matiere + ", etudiant=" + etudiant + "]";
	}
    
    
}

