import java.util.Arrays;
import java.util.Comparator;

public class SearchTest {

    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(205, "Shirt", "Clothing"),
            new Product(333, "Smartphone", "Electronics"),
            new Product(150, "Book", "Stationery")
        };

        System.out.println("Linear Search:");
        Product result1 = linearSearch(products, 205);
        System.out.println(result1 != null ? result1 : "Product not found");

        // Sort for binary search
        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));

        System.out.println("\nBinary Search:");
        Product result2 = binarySearch(products, 205);
        System.out.println(result2 != null ? result2 : "Product not found");
    }

    public static Product linearSearch(Product[] products, int targetId) {
        for (Product p : products) {
            if (p.productId == targetId) {
                return p;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, int targetId) {
        int low = 0, high = products.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (products[mid].productId == targetId) {
                return products[mid];
            } else if (products[mid].productId < targetId) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return null;
    }
}
