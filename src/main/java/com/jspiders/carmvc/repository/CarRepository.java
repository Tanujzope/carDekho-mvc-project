package com.jspiders.carmvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspiders.carmvc.pojo.CarPojo;

@Repository
public class CarRepository {
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	
	private static void openConnection() {
		factory = Persistence.createEntityManagerFactory("carmvc");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}
	
	private static void closeConnection() {
		if (factory != null) {
			factory.close();
		}
		if (manager != null) {
			manager.close();
		}
		if (transaction != null) {
			if (transaction.isActive()) {
				transaction.rollback();;
			}
		}
	}

	public List<CarPojo> findAllCars() {
		openConnection();
		transaction.begin();
		
		String jpql = "from CarPojo";
		query = manager.createQuery(jpql);
		
		List<CarPojo> cars = query.getResultList();
		transaction.commit();
		closeConnection();
		return cars;
		
	}

	public CarPojo addCar(String carname, String carbrand, String fueltype, double carprice) {
		openConnection();
		transaction.begin();
		
		CarPojo car = new CarPojo();
		car.setName(carname);
		car.setBrandName(carbrand);
		car.setFuelType(fueltype);
		car.setPrice(carprice);
		manager.persist(car);
		
		transaction.commit();
		closeConnection();
		return car;
		
		
	}

	public CarPojo removeCar(int id) {
		openConnection();
		transaction.begin();
		
		CarPojo car = manager.find(CarPojo.class, id);
		if (car!= null) {
			manager.remove(car);
		}
		
		transaction.commit();
		closeConnection();
		return car;
	}

	public CarPojo getCar(int id) {
		openConnection();
		transaction.begin();
		
		CarPojo car = manager.find(CarPojo.class, id);
		if (car!= null) {
			transaction.commit();
			closeConnection();
			return car;
		}
		
		transaction.commit();
		closeConnection();
		return null;
	}

	public CarPojo updateCar(int id, String name, String brand, String fuelType, double price) {
		openConnection();
		transaction.begin();
		
		CarPojo car = manager.find(CarPojo.class, id);
		if (car!= null) {
			car.setName(name);
			car.setBrandName(brand);
			car.setFuelType(fuelType);
			car.setPrice(price);
			
			manager.persist(car);
			
			transaction.commit();
			closeConnection();
			
			return car;
		}
		
		transaction.commit();
		closeConnection();
		return null;
	}

	

}