package modele;

import java.util.*;

import javax.persistence.*;

@Entity
public class Matiere {
	@Id
	@GeneratedValue
	private Integer id;
	private String nom;
	private String date_ratt;
	private String controlle;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "enseignant_id")
	private Enseignant enseignant;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "module_id")
	private Modules module;
	public Matiere() {
	}
	
	public Matiere(Integer id, String nom, String date_ratt, String controlle,Enseignant enseignant,Modules module) {
		this.id = id;
		this.nom = nom;
		this.date_ratt = date_ratt;
		this.controlle = controlle;
		this.enseignant=enseignant;
		this.module=module;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDate_ratt() {
		return date_ratt;
	}
	public void setDate_ratt(String date_ratt) {
		this.date_ratt = date_ratt;
	}
	public String getControlle() {
		return controlle;
	}
	public void setControlle(String controlle) {
		this.controlle = controlle;
	}

	@Override
	public String toString() {
		return "Matiere [id=" + id + ", nom=" + nom + ", date_ratt=" + date_ratt + ", controlle=" + controlle + "]";
	}

	public String getNomMatiere() {
			return null;
	}
}
