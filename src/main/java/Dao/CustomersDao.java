package Dao;

import domain.Customers;

import java.util.List;

public interface CustomersDao {
    List<Customers> findAll();
}
