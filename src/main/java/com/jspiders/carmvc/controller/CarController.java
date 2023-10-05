package com.jspiders.carmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspiders.carmvc.pojo.CarPojo;
import com.jspiders.carmvc.pojo.UserPojo;
import com.jspiders.carmvc.service.CarService;

@Controller
public class CarController {
	
	@Autowired
	private CarService service;
	
	@GetMapping("/home")
	public String home(@SessionAttribute(name = "login", required = false)UserPojo user,ModelMap map ) {
		if(user != null) {
			return "Home";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
	
	
	
	
	@GetMapping("/add")
	public String addPage(@SessionAttribute(name = "login", required = false)UserPojo user, ModelMap map) {
		if (user!= null) {
			List<CarPojo> cars = service.findAllCars();
			if (!cars.isEmpty()) {
				map.addAttribute("cars", cars);
				return "AddCar";
			}
			map.addAttribute("failMsg", "No Cars Available!!!");
			return "AddCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Poceed...");
		return "Login";
	}
	
	
	
	
	@PostMapping("/add")
	public String addCar(@SessionAttribute(name = "login", required = false)UserPojo user, @RequestParam String carname, @RequestParam String carbrand,
						@RequestParam String fueltype, @RequestParam double carprice ,ModelMap map) {
		if (user != null) {
			CarPojo car = service.addCar(carname, carbrand, fueltype,carprice);
			if (car != null) {
				map.addAttribute("succMsg", "Car Added Successfully...");
				List<CarPojo> cars = service.findAllCars();
				map.addAttribute("cars", cars);
				return "AddCar";
			}
			map.addAttribute("failMsg", "Data Insertion Failed!!!");
			return "AddCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
	
	
	
	
	@PostMapping("/remove")
	public String removeCar(@SessionAttribute(name = "login", required = false)UserPojo user, @RequestParam int id, ModelMap map) {
		if (user != null) {
			CarPojo car = service.removeCar(id);
			if (car!= null) {
				map.addAttribute("succMsg", "Car Removed Successfully...");
				List<CarPojo> cars = service.findAllCars();
				map.addAttribute("cars", cars);
				return "RemoveCar";				
			}
			map.addAttribute("failMsg" ,"Car Not Removed!!!");
			return "RemoveCar";
		}
		map.addAttribute("warMsg", "Sesion Inactive, Login to Proceed...");
		return "Login";
	}
	
	
	@GetMapping("/remove")
	public String getRemovePage(@SessionAttribute(name = "login", required = false)UserPojo user, ModelMap map) {
		if (user != null) {
			List<CarPojo> cars = service.findAllCars();
			if (!cars.isEmpty()) {
				map.addAttribute("cars", cars);
				return "RemoveCar";
			}
			map.addAttribute("failMsg", "No Cars Present...");
			return "RemoveCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
	
	@PostMapping("/getCar")
	public String getCar(@SessionAttribute(name = "login", required = false)UserPojo user, @RequestParam int id, ModelMap map) {
		if (user != null) {
			CarPojo car = service.getCar(id);
			if (car!= null) {
				map.addAttribute("succMsg", "Car Fetched Successfully...");
				map.addAttribute("car", car);
				return "UpdateCar";
			}
			map.addAttribute("warMsg", "No Car Selected...");
			return "UpdateCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
	
	@GetMapping("/update")
	public String updatePage(@SessionAttribute(name = "login", required = false)UserPojo user, ModelMap map) {
		if (user != null) {
			List<CarPojo> cars = service.findAllCars();
			if (!cars.isEmpty()) {
				map.addAttribute("cars", cars);
				return "UpdateCar";
			}
			map.addAttribute("failMsg", "No Cars Present...");
			return "UpdateCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
	
	@PostMapping("/update")
	public String updateCar(@SessionAttribute(name = "login", required = false)UserPojo user, @RequestParam int id, @RequestParam String name,
			@RequestParam String brand, @RequestParam String fuelType, @RequestParam double price, ModelMap map) {
		if (user != null) {
			CarPojo car = service.updateCar(id, name, brand, fuelType, price);
			if (car != null) {
				map.addAttribute("succMsg", "Car Update Successfully...");
				return "UpdateCar";
			}
			map.addAttribute("failMsg", "Car not Updated!!!");
			return "UpdateCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
	
	
	@GetMapping("/search")
	public String searchCar(@SessionAttribute (name = "login", required = false)UserPojo user, @RequestParam int id, ModelMap map) {
		if (user != null) {
			CarPojo car = service.getCar(id);
			if (car != null) {
				map.addAttribute("succMsg", "Car Record Fetched Successfully...");
				map.addAttribute("car", car);
				return "SearchCar";
			}
			map.addAttribute("failMsg", "Car Not Available Of ID "+id);
			return "SearchCar";
		}
		map.addAttribute("warMsg", "Session Inactive, Login to Proceed...");
		return "Login";
	}
}