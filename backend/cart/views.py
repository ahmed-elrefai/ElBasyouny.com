from django.shortcuts import render, redirect, get_object_or_404
from store.models import Product
from .cart import Cart
from django.core.mail import send_mail
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
import logging
import json
import datetime
from django.conf import settings

def show_cart(request):
    cart = Cart(request)
    return render(request, 'cart.html', {'cart_items': cart.cart.items(), 'cart_count': len(cart), 'cart_total': cart.get_total_price()})

def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.add(product=product)
    return redirect('/cart/show-cart/')

@require_POST
def update_quantity(request, item_id):
    cart = request.session.get('cart', {})
    if item_id not in cart:
        return JsonResponse({'error': 'Item not found in cart.'}, status=400)
    
    try:
        quantity = int(request.POST.get('quantity'))
        if quantity <= 0:
            del cart[item_id]
        else:
            cart[item_id] = quantity
        request.session['cart'] = cart
        return JsonResponse({'message': 'Quantities updated successfully.'})
    except (ValueError, TypeError):
        return JsonResponse({'error': 'Invalid quantity.'}, status=400)




def remove_item(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.remove(product=product)
    return redirect('/cart/show-cart/')

logger = logging.getLogger(__name__)


@require_POST
def confirm_order(request):
    try:
        data = json.loads(request.body)
        name = data.get('name')
        email = data.get('email')
        address = data.get('address')
        phone = data.get('phone')
        
        if not all([name, email, address, phone]):
            return JsonResponse({'error': 'All fields are required.'}, status=400)
        
        cart = Cart(request)
        cart_items = cart.cart.items()

        if not cart_items:
            return JsonResponse({'error': 'No items in the cart.'}, status=400)

        order_details = ""
        total_price = 0  # Initialize total price
        for id, item in cart_items:
            order_details += f"{item['title']} (الكمية: {item['quantity']}) - ج.م {item['subtotal']}\n"
            total_price += item['subtotal']  # Accumulate total price
        order_details += f"\n إجمالي السعر: ج.م {total_price}"
        order_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        # Send email to customer
        send_mail(
            'تأكيد الطلب - البسيوني',
            f'''شكراً {name}، لاختياركم البان البسيوني.

تفاصيل طلبك:
{order_details}

سيتم شحن طلبك إلى: {address}.
سيتواصل معك أقرب فرع لدينا قريباً على الرقم: {phone}.
''',
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False,
        )

        # Send email to branches
        send_mail(
            'طلب جديد',
            f'''طلب جديد بأسم: {name}
جوال: {phone}

التفاصيل:
{order_details}

وقت الطلب: {order_time}
العنوان: {address}

يرجى تأكيد الطلب مع العميل من خلال الرقم بالأعلى.
''',
            settings.EMAIL_HOST_USER,
            settings.BRANCHES_EMAILS,
            fail_silently=False,
        )
        cart.clear()
        return JsonResponse({'message': 'تم تأكيد الطلب وإرسال البريد الإلكتروني.'})

    except json.JSONDecodeError:
        return JsonResponse({'error': 'Invalid JSON data.'}, status=400)
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)