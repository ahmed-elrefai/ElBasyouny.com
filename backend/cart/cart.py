import project.settings as settings
from store.models import Product

class Cart(object):
    def __init__(self, request):
        self.session = request.session
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart
    
    def add(self, product, quantity=1, override_quantity=False):
        product_id = str(product.id)  # Convert product_id to string
        if product_id not in self.cart:
            self.cart[product_id] = {'quantity': 0, 'price': float(product.price), 'img': str(product.img), 'title': product.title}
        
        if override_quantity:
            self.cart[product_id]['quantity'] = quantity
        else:
            self.cart[product_id]['quantity'] += quantity
            
        self.cart[product_id]['subtotal'] = self.get_sub_total_price(float(self.cart[product_id]['price']), self.cart[product_id]['quantity'])

        self.save()
    
    def save(self):
        self.session[settings.CART_SESSION_ID] = self.cart
        self.session.modified = True
    
    def remove(self, product):
        product_id = str(product.id)  # Convert product_id to string
        if product_id in self.cart:
            del self.cart[product_id]
        self.save()

    def __len__(self):
        return sum(item['quantity'] for item in self.cart.values())

    def get_sub_total_price(self, price, quantity) -> float:
        return float(price * quantity)
    
    def get_total_price(self):
        for item in self.cart.values():
            print(item)  # Debugging: Print each item to check its structure
        return sum(self.get_sub_total_price(item['price'], item['quantity']) for item in self.cart.values())

    def clear(self):
        for key in list(self.cart.keys()):
            del self.cart[key]
        self.save()
    