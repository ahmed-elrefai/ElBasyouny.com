from django.test import TestCase
from .models import Product, Category
from .views import get_products

# Create your tests here.

class ProductsTestCase(TestCase):
    def setup(self):
        test_category = Category.objects.filter(name='dairy products')
        Product.objects.create(title="milk with rice", price="12", category=test_category, description="so tasty!"
                            , img_url="../media/uploads/products")
    def test_endpoint(self):
        """testing if the get_products view is working"""
        self.assertEqual(2, len(Product.objects.filter(category="dairy products")))