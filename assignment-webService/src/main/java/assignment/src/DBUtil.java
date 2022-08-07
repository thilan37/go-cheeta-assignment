/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package assignment.src;
import java.util.List;

/**
 *
 * @author thilan
 */
public interface DBUtil {
   public List<Customer> getCustomers();
   public boolean addUser(User customer);
   public User getUserByMobile(String mobile);
   public boolean authUser(String mobile, String password);
   
   
   // admin area 
   public boolean addCity(City city);
   public List<City> getCities();
   public boolean deleteCity(int id);
   public City getCityById(int id);
   public boolean updateCity(City city);
   public boolean addBranch(Branch branch);
   public List<Branch> getBranches();
   public boolean deleteBranch(int branch_id);
   public Branch getBranchById(int branch_id);
   public boolean upadteBranch(Branch branch);
   public boolean addVehicleType(VehicleType type);
   public List<VehicleType> getVehicleTypes();
   public boolean deleteVehicleType(int vehicleId);
   public VehicleType getVehicleTypeById(int vehicleType);
   public boolean updateVehicleType(VehicleType type);
   public boolean addDriver(Driver driver);
   public List<Driver> getDrivers();
   public boolean deleteDriver(int driverId);
   public Driver getDriverById(int driverId);
   public boolean updateDriver(Driver driver);
}
