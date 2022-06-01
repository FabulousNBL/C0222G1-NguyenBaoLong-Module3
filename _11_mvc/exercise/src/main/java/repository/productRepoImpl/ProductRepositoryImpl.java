package repository.productRepoImpl;

import model.Product;
import repository.ProductRepoImpl;
import service.productImpl.ProductServiceImpl;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepoImpl {

    public static Map<Integer, Product> products= new LinkedHashMap<>();
    static {
        products.put(1,new Product(1,"Coca",20000));
        products.put(2,new Product(2,"Sting",15000));
        products.put(3,new Product(3,"Fanta",18000));
        products.put(4,new Product(4,"Pepsi",20000));
        products.put(5,new Product(5,"Sprite",14000));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
            return products.get(id);

    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> productList= new ArrayList<>();
        for (Product item: products.values()) {
            if (item.getName().contains(name)){
                productList.add(item);
            }
        }
        return productList;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }
}
