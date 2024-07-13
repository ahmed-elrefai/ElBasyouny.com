from django.shortcuts import render, redirect, get_object_or_404
from store.models import Product
from .cart import Cart

def show_cart(request):
    cart = Cart(request)
    return render(request, 'cart.html', {'cart_items': cart.cart.items(), 'cart_total': cart.get_total()})

def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.add(product=product)
    return redirect('/')

def remove_item(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.remove(product=product)
    return redirect('/cart/show-cart')