package services;

import java.util.List;

import dao.IDaoHotel;
import dao.IDaoLocale;
import dao.IDaoRemote;
import entities.Hotel;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import entities.Hotel;

@Stateless(name = "Oumaima")
@PermitAll
	
	public class HotelService implements IDaoRemote<Hotel>, IDaoHotel {
		
		@PersistenceContext
		private EntityManager em;

		@Override
		public Hotel create(Hotel o) {
			em.persist(o);
			return o;
		}

		@Override
		public boolean delete(Hotel o) {
			em.remove(o);
			return true;
		}

		@Override
		public  Hotel update(Hotel o) {
			// TODO Auto-generated method stub
			return null ;
		}

		@Override
		public Hotel findById(int id) {
			// TODO Auto-generated method stub
			return em.find(Hotel.class, id);
		}

		@Override
		public List<Hotel> findAll() {
			Query query = em.createQuery("select h from Hotel h");
			return query.getResultList();
		}

	}



