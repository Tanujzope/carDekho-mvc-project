package com.jspiders.carmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspiders.carmvc.pojo.CarPojo;
import com.jspiders.carmvc.repository.CarRepository;

@Service
public class CarService {
	
	@Autowired
	private CarRepository repository;

	public List<CarPojo> findAllCars() {
		List<CarPojo> cars = repository.findAllCars();
		return cars;
	}

	public CarPojo addCar(String carname, String carbrand, String fueltype, double carprice) {
		CarPojo car = repository.addCar(carname, carbrand, fueltype,carprice);
		return car;
	}

	public CarPojo removeCar(int id) {
		CarPojo car = repository.removeCar(id);
		return car;
	}

	public CarPojo getCar(int id) {
		CarPojo car = repository.getCar(id);
		return car;
	}

	public CarPojo updateCar(int id, String name, String brand, String fuelType, double price) {
		CarPojo car = repository.updateCar(id, name, brand, fuelType,price);
		return car;
	}

	

}
