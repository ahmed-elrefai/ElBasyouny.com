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
    quantity = request.POST.get('quantity')
    cart = Cart(request)

    if item_id in cart.cart.keys():
        try:
            cart.cart[item_id]['quantity'] = int(quantity)
            cart.cart[item_id]['subtotal'] = cart.get_sub_total_price(
                float(cart.cart[item_id]['price']),
                cart.cart[item_id]['quantity']
            )
            cart.save()  # Save the cart after updating the quantity
            return JsonResponse({'message': 'Quantities updated successfully.'})
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Item not found in cart.'}, status=404)




def remove_item(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = Cart(request)
    cart.remove(product=product)
    return redirect('/cart/show-cart/')

logger = logging.getLogger(__name__)


@csrf_exempt
def confirm_order(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            name = data.get('name')
            email = data.get('email')
            address = data.get('address')
            phone = data.get('phone')
            
            cart = Cart(request)
            cart_items = cart.cart.items()  # Get the cart items directly from the Cart object

            if not cart_items:
                return JsonResponse({'error': 'No items in the cart.'}, status=400)

            order_details = ""
            for id, item in cart_items:
                order_details += f"{item['title']} (الكمية: {item['quantity']}) - ج.م {item['subtotal']}\n"

            # Send email
            try:
                send_mail(
                    'تأكيد الطلب - البسيوني',
                    f'شكراً {name}, لأختياركم البان البسيوني.\n\nتفاصيل طلبك:\n{order_details}\nسيتم شحن طلبك إلى {address}.\nسيتواصل معك أقرب فرع لدينا قريباً على الرقم {phone}.',
                    settings.EMAIL_HOST_USER,
                    [email],
                    fail_silently=False,
                )
                send_mail(
                    'طلب جديد',
                    f'طلب جديد بأسم: {name}, جوال: {phone} \n التفاصيل:\n {order_details} \n وقت الطلب: {datetime.datetime.now()} \t العنوان: {address} \n يرجي تأكيد الطلب مع العميل من خلال الرقم بالأعلي',
                    settings.EMAIL_HOST_USER,
                    [email],
                    fail_silently=False,
                )
                return JsonResponse({'message': 'تم تأكيد الطلب وإرسال البريد الإلكتروني.'})
            except Exception as e:
                logger.error(f'خطأ في إرسال البريد الإلكتروني: {e}')
                return JsonResponse({'error': str(e)}, status=500)
        except json.JSONDecodeError as e:
            return JsonResponse({'error': 'Invalid JSON data.'}, status=400)

    return JsonResponse({'error': 'Invalid request method.'}, status=405)