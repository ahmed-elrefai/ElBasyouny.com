from django.test import TestCase
from django.urls import reverse
from store.models import Category, Product
from cart.cart import Cart
import json

class CartViewTests(TestCase):
    def setUp(self):
        self.category = Category.objects.create(name="Test Category")
        self.product = Product.objects.create(title="Test Product", price=100, category=self.category)

    def test_show_cart(self):
        response = self.client.get(reverse('show_cart'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'cart.html')

    def test_add_to_cart(self):
        response = self.client.post(reverse('add_to_cart', args=[self.product.id]))
        self.assertEqual(response.status_code, 302) 

        cart = self.client.session.get('cart', {})
        self.assertIn(str(self.product.id), cart)  
        self.assertEqual(cart[str(self.product.id)]['quantity'], 1) 

    def test_update_quantity(self):
        # Add product to cart first
        self.client.post(reverse('add_to_cart', args=[self.product.id]))

        # Now update the quantity
        response = self.client.post(reverse('update_quantity', args=[self.product.id]), {'quantity': 2})
        self.assertEqual(response.status_code, 200)

        cart = self.client.session.get('cart', {})
        self.assertEqual(cart[str(self.product.id)]['quantity'], 2)  # Check updated quantity

    def test_remove_item(self):
        # Add product to cart first
        self.client.post(reverse('add_to_cart', args=[self.product.id]))

        # Now remove it
        response = self.client.post(reverse('remove_item', args=[self.product.id]))
        self.assertEqual(response.status_code, 302)  # Expecting a redirect

        cart = self.client.session.get('cart', {})
        self.assertNotIn(str(self.product.id), cart)  # Product should be removed

    def test_confirm_order(self):
        # Add product to cart first
        self.client.post(reverse('add_to_cart', args=[self.product.id]))

        # Confirm the order
        data = {
            'name': 'Test User',
            'email': 'test@example.com',
            'address': 'Test Address',
            'phone': '1234567890'
        }
        response = self.client.post(reverse('confirm_order'), data=json.dumps(data), content_type='application/json')
        self.assertEqual(response.status_code, 200)

        # Check the success message in the response
        response_data = response.json()
        self.assertIn('message', response_data)

    def test_confirm_order_no_items(self):
        data = {
            'name': 'Test User',
            'email': 'test@example.com',
            'address': 'Test Address',
            'phone': '1234567890'
        }
        response = self.client.post(reverse('confirm_order'), data=json.dumps(data), content_type='application/json')
        self.assertEqual(response.status_code, 400)  # Expecting a bad request

        response_data = response.json()
        self.assertIn('error', response_data)
