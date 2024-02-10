package main;

import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;


import metier.EnseignantRep;
import metier.EtudiantRep;
import metier.MatiereRep;
import metier.ModuleRep;
import metier.NoteRep;
import metier.administrateurRep;
import modele.Enseignant;
import modele.Matiere;
import modele.Modules;
import modele.Notes;
import modele.administrateur;
import modele.etudiant;



public class main {

    public static void main(String[] args) {
    	
    	
       
       
        EtudiantRep etudiantRep = new EtudiantRep();
        administrateurRep admin = new administrateurRep();
       	administrateurRep admin2 = new administrateurRep(etudiantRep);
    
       	MatiereRep matierRep= new MatiereRep();
       	administrateurRep admin3 = new administrateurRep(matierRep);
       	NoteRep noteRep =new NoteRep();
       	EnseignantRep enseignantRep= new EnseignantRep();
       	EnseignantRep enseignantRep2= new EnseignantRep(noteRep);
       	ModuleRep moduleRep= new ModuleRep();
       	
       	
        etudiant etd = new etudiant("salma", "elmeslih", "CD6789", 22,"salma@gmail.com", "123","N34567");
        etudiant etd2 = new etudiant("hajar", "moslih", "CD469", 22,"hajar@gmail.com", "456","N234567");
        etudiant etd3 = new etudiant("Youness", "Meriaf", "CD63333", 21,"youness@gmail.com", "222","N1323234");
        administrateur admin1 = new administrateur("Hamza", "Chakir", "CD5678", 40,"Hamza@gmail.com", "432","surveillant general");
        
       
        
        Enseignant enseignant = new Enseignant("Filali", "Hajar", "CD566", 25, "hajar@example.com", "676");
        
        Enseignant esgnt2 = new Enseignant("riffi", "mohamed", "CD456", 25, "riffi@example.com", "4567");
        
         //Matiere m1 = new Matiere(null,"nosql","24/08/2019","20/08/2021",enseignant);
         
         Enseignant esgnt3 = new Enseignant("hilali", "adeberahim", "CD569", 59, "hilali@example.com", "9615");
         
         //Matiere m2 = new Matiere(null,"windows","24/08/2019","20/08/2021",esgnt3);
         
         
        
        
        //Notes note = new Notes(17.0, m1, etd3, enseignant);
        //Notes note2 = new Notes(17.0, m1, etd3, enseignant);

        // Sauvegarder dans la base de données
        etudiantRep.save(etd);
        etudiantRep.save(etd3);
        admin.save(admin1);
        
        enseignantRep.save(esgnt3);
        //matierRep.save(m2);
        
        
      
        


        // Trouver une personne par son CIN
        etudiant etdTrouvee = etudiantRep.findById("CD6789");

         //Afficher le nom de la personne trouvée
        if (etdTrouvee != null) {
            System.out.println(etdTrouvee.getNom());
        }
        
        //test pour admin
        etudiant etdd = new etudiant("sara", "mosliih", "CD4567", 22,"sara@gmail.com", "567","N34678");
        admin2.ajouterEtudiant(etdd);
        Modules module =new Modules(null,"Base de donnes");
        Matiere m5 = new Matiere(null,"java","24/08/2019","20/08/2021",esgnt2,module);
        Matiere m1 = new Matiere(null,"nosql","24/08/2019","20/08/2021",enseignant,module);
        
        moduleRep.save(module);
        admin3.ajouterMatiere(m5);
        matierRep.save(m1);
        // test pour enseignant
        Notes nn = new Notes(etdd,m5,20,esgnt2);       
        enseignantRep2.ajouterNote(nn);
        
        Notes n2 = new Notes(etd,m1,16,enseignant);  
        enseignantRep2.ajouterNote(n2);
        Notes n3 = new Notes(etd,m5,13,enseignant);  
        noteRep.save(n3);
        
        
        
        
 
        System.out.println("Liste de tous les notes :");
        try {
        	Integer i=1;
        	List<Notes>notes=noteRep.findAll();
        	notes.forEach(System.out::println);     
        	//moduleRep.findnotes(i);/
        } catch (Exception e) {
            e.printStackTrace();
        
        }
        
        /*System.out.println("Liste des matières et notes pour un seul enseignant :");
        List<Notes> notesEnseignant = enseignantRep.getNotes(enseignant);
        for (Notes note : notesEnseignant) {
            System.out.println("Étudiant: " + note.getEtudiant().getNom() +
                               ", Matière: " + note.getMatiere().getNom() +
                               ", Note: " + note.getNote());
        }*/

        //test pour etudiant
        // Supprimer une personne par son id
        //etudiantRep.deleteById("CD6789");
        
        //la liste des etudiant
        System.out.println("Liste de tous les etudiants :");
        List<etudiant> etudiants = etudiantRep.findAll();
        etudiants.forEach(System.out::println);
        
    }
}
