package service.productImpl;

import model.Product;
import repository.productRepoImpl.ProductRepositoryImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements service.ProductServiceImpl {
    ProductRepositoryImpl productRepository= new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Map<String, String> save(Product product) {
        Map<String,String> map= new HashMap<>();
        if (product.getPrice()<5000){
            map.put("price","Giá không được nhỏ hơn 5000");
        }
        if (product.getPrice()>30000){
            map.put("price","Giá không được lớn hơn 30000");
        }
        if (map.isEmpty()){
            productRepository.save(product);
        }
        return map;
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id,product);
    }
}
