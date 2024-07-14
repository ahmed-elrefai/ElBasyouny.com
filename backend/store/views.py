from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from cart.cart import Cart
from .models import *
from .Serializers import *

def home(request):
    cart = Cart(request)
    return render(request, 'home.html', {'products': Product.objects.all(), 'categories': Category.objects.all(), 'cart_count': len(cart)})


class ProductsView(generics.ListAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer 

class OrdersView(generics.ListAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

class CustomersView(generics.ListAPIView):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer 

class CategoriesView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategoriesSerializer 

class ProductsByCategoryView(APIView):
    def get(self, request, category):
        products = Product.objects.filter(category__name=category)
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)
    
class ProductsByCategoryLimited(APIView):
    def get(self, request, category, number):
        products = Product.objects.filter(category__name=category)[:number]
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)

class ProductsLimited(APIView):
    def get(self, request, number):
        products = Product.objects.all()[:number]
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)