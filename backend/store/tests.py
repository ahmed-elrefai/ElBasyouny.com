# myapp/tests.py
from django.test import TestCase
from .models import Category, Customer, Order, Product

# unit tests

class ProductTest(TestCase):
    def setUp(self):
        dairy= Category.objects.create(name='dairy_prods')
        vegs = Category.objects.create(name='خضار')

        Product.objects.create(title="milk", price=45, category=dairy)
        Product.objects.create(title="بطيخ",price=200, category=vegs)

    def test_my_model_creation(self):
        """Test that the MyModel objects are created correctly."""
        test1 = Product.objects.get(title="milk")
        test2 = Product.objects.get(title="بطيخ")
        self.assertEqual(test1.category, Category.objects.get(name='dairy_prods'), 'english category test failed')
        self.assertEqual(test2.category, Category.objects.get(name='خضار'), 'arabic category test failed')
        self.assertEqual(test2.price, 200)

# 

# myapp/tests.py
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from django.test import TestCase
from .models import Product, Category, Customer, Order
from .Serializers import ProductSerializer, OrderSerializer, CustomerSerializer, CategoriesSerializer

class HomeViewTest(TestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")
        self.product = Product.objects.create(title="Test Product", price=100, category=self.category)
        self.cart = self.client.session['cart'] = {}

    def test_home_view(self):
        response = self.client.get(reverse('home'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'home.html')
        self.assertContains(response, self.product.title)
        self.assertContains(response, self.category.name)
        self.assertIn('cart_count', response.context)

class ProductsViewTest(APITestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")
        self.product = Product.objects.create(title="Test Product", price=100, category=self.category)

    def test_get_products(self):
        response = self.client.get(reverse('products'))
        products = Product.objects.all()
        serializer = ProductSerializer(products, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

class OrdersViewTest(APITestCase):
    def setUp(self):
        self.customer = Customer.objects.create(first_name="Test", last_name="Customer")
        self.category = Category.objects.create(name="Test Category")
        self.product = Product.objects.create(title="Test Product", price=100, category=self.category)
        self.order = Order.objects.create(customer=self.customer, product=self.product, quantity=10)  # Include product

    def test_get_orders(self):
        response = self.client.get(reverse('orders'))
        orders = Order.objects.all()
        serializer = OrderSerializer(orders, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

class CustomersViewTest(APITestCase):
    def setUp(self):
        self.customer = Customer.objects.create(first_name="Test", last_name=" Customer")

    def test_get_customers(self):
        response = self.client.get(reverse('customers'))
        customers = Customer.objects.all()
        serializer = CustomerSerializer(customers, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

class CategoriesViewTest(APITestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")

    def test_get_categories(self):
        response = self.client.get(reverse('categories'))
        categories = Category.objects.all()
        serializer = CategoriesSerializer(categories, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

class ProductsByCategoryViewTest(APITestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")
        self.product = Product.objects.create(title="Test Product", price=100, category=self.category)

    def test_get_products_by_category(self):
        response = self.client.get(reverse('products_by_category', kwargs={'category': self.category.name}))
        products = Product.objects.filter(category__name=self.category.name)
        serializer = ProductSerializer(products, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

class ProductsByCategoryLimitedViewTest(APITestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")
        for i in range(5):
            Product.objects.create(title=f"Test Product {i}", price=100, category=self.category)

    def test_get_limited_products_by_category(self):
        response = self.client.get(reverse('limited_products_by_category', kwargs={'category': self.category.name, 'number': 2}))
        products = Product.objects.filter(category__name=self.category.name)[:2]
        serializer = ProductSerializer(products, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)

class ProductsLimitedViewTest(APITestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")
        for i in range(5):
            Product.objects.create(title=f"Test Product {i}", price=(100 + 5*(i*i)), category=self.category)

    def test_get_limited_products(self):
        response = self.client.get(reverse('get_latest', kwargs={'number': 2}))
        products = Product.objects.all()[:2]
        serializer = ProductSerializer(products, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serializer.data)
 
