from django.shortcuts import render, redirect, get_object_or_404
from store.models import Product
from .cart import Cart

def show_cart(request):
    cart = Cart(request)
    return render(request, 'cart.html', {'cart_items': cart.cart.items(), 'cart_count': len(cart), 'cart_total': cart.get_total_price()})

def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.add(product=product)
    return redirect('/cart/show-cart/')

def update_quantity(request, item_id:str):
    item_id = str(item_id)
    if request.method == 'POST':
        quantity = int(request.POST.get('quantity', 1))  # Default to 1 if not provided
        cart = Cart(request)
        cart.cart[str(item_id)]['quantity'] = quantity
        cart.cart[item_id]['subtotal'] = cart.get_sub_total_price(float(cart.cart[item_id]['price']), cart.cart[item_id]['quantity'])
        cart.save()  # Make sure to save the cart
    return redirect('/cart/show-cart/')


def remove_item(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.remove(product=product)
    return redirect('/cart/show-cart/')