package metier;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import modele.Notes;

public class NoteRep extends rep<Notes, Long> {
	public NoteRep() {
		super(Notes.class);
	}
}