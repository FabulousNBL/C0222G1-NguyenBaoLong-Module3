package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface ProductServiceImpl {
    List<Product> findAll();
    Map<String,String> save(Product product);
    void delete(int id);
    Product findById(int id);
    List<Product> searchByName(String name);
}
