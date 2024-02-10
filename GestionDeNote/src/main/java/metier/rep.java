package metier;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import modele.personne;



public class rep<T , U> {
	private Class<T> EntityClass;
	private EntityManagerFactory emf;
	protected static EntityManager em;
	
	
	public rep(Class<T> entityClass) {
		this.EntityClass = entityClass;
		emf = Persistence.createEntityManagerFactory("NotPu");
		if (em==null)
			em = emf.createEntityManager();
	}
	
	  public rep(Class<T> entityClass, EntityManagerFactory emf) {
	        this.EntityClass = entityClass;
	        this.emf = emf;
	    }

	 
	public void save (T t) {
		try {
			em.getTransaction().begin();
			System.out.println(t);
			em.persist(t);
			em.getTransaction().commit();
		}catch(Exception e) {
			System.out.println("Exceptiom  :  "+e);
			em.getTransaction().rollback();
		}
	}
	
	public T findById(U CIN) {
		return em.find(EntityClass, CIN);
	}
	
	public List<T> findAll(){
		return em.createQuery("FROM " + EntityClass.getSimpleName(), EntityClass).getResultList();

	}
	
	public void deleteById(U CIN) {
		T t = em.find(EntityClass, CIN);
		if(t != null) {
			try {
				em.getTransaction().begin();
				em.remove(t);
				em.getTransaction().commit();
			}catch(Exception e) {
				em.getTransaction().rollback();
			}
		}
	}
	
	public void delete(T t) {
		
		if(t != null) {
			try {
				em.getTransaction().begin();
				em.remove(t);
				em.getTransaction().commit();
			}catch(Exception e) {
				em.getTransaction().rollback();
			}
		}
	}
	
	public void modify(T t) {
		
		if(t != null) {
			try {
				em.getTransaction().begin();			
				em.merge(t);
				em.getTransaction().commit();
			}catch(Exception e) {
				em.getTransaction().rollback();
			}
		}
	}
	public List<T>findnote(U t){
		return em.createQuery("SELECT note FROM notes,etudiant,matiere,modules where modules.id=:t", EntityClass)
				.setParameter("t", t).getResultList();
	}
	

	
//	  public T findByEmail(String email) {
//	        EntityManager em = emf.createEntityManager();
//	        try {
//	            return em.find(EntityClass, email);
//	        } finally {
//	            if (em != null && em.isOpen()) {
//	                em.close();
//	            }
//	        }
//	    }
//	
	public personne findByEmail(String email) {
	    try {
	        // Create an EntityManager instance
	        EntityManager em = emf.createEntityManager();

	        // Use TypedQuery to create a query to find the person by email
	        TypedQuery<personne> query = em.createQuery("SELECT p FROM personne p WHERE p.email = :email", personne.class);
	        query.setParameter("email", email);

	        // Execute the query and return the result
	        return query.getSingleResult();
	    } catch (NoResultException ex) {
	        // Handle the case where no result is found
	        return null;
	    } finally {
	        // Ensure that the EntityManager is closed after use
	        if (em != null && em.isOpen()) {
	            em.close();
	        }
	    }
	}


	
	
	/*public List<T> findnotes(U t) {
	    return em.createQuery("SELECT n FROM Notes n, Etudiant e, Matiere m, Modules mo WHERE mo.id = :t", EntityClass)
	            .setParameter("t", t)
	            .getResultList();
	}*/


}
