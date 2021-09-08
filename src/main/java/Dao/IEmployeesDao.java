package Dao;

import domain.Lists;
import domain.employees;

import java.util.List;


/**
 * 员工持久层接口
 */
public interface IEmployeesDao {

   List<employees> findAll();
   employees find(employees employee);

   employees findID(int id);


}
