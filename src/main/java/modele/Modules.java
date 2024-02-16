package modele;
import java.util.*;
import javax.persistence.*;
@Entity
public class Modules {
	@Id
	@GeneratedValue
	private Integer id;
	private String nom;

    
	public Modules() {
	}
	public Modules(Integer id, String nom) {
		this.id = id;
		this.nom = nom;
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
	
}
	

