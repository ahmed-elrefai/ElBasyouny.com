from rest_framework import serializers
from .models import Product, Category, Customer, Order

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['id', 'title', 'price','category', 'description','img']

class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ['id','first_name', 'last_name', 'phone', 'email', 'password']


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ['id','product', 'customer', 'quantity', 'address', 'phone',
                  'date', 'status']