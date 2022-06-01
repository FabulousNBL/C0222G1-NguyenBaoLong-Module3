package repository;

import model.Product;

import java.util.List;
import java.util.Map;

public interface ProductRepoImpl {
    List<Product> findAll();
    void save(Product product);
    void delete(int id);
    Product findById(int id);
    List<Product> searchByName(String name);
    void update(int id, Product product);
}
