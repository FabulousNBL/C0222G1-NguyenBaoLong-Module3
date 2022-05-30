package repository.productRepoImpl;

import model.Product;
import repository.ProductRepoImpl;
import service.productImpl.ProductServiceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepoImpl {

    public static List<Product> products= new ArrayList<>();
    static {
        products.add(new Product(0,"Coca",20000));
        products.add(new Product(1,"Sting",15000));
        products.add(new Product(2,"Fanta",18000));
        products.add(new Product(3,"Pepsi",20000));
        products.add(new Product(4,"Sprite",14000));
    }
    @Override
    public List<Product> findAll() {

        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
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
        List<Product> list= new ArrayList<>();
        for (Product item: products) {
            if (item.getName().equals(name)){
                list.add(item);
            }
        }

        return list;
    }
}
