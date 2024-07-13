import project.settings as settings

class Cart:
    def __init__(self, request):
        self.session = request.session
        self.cart = self.session.setdefault(settings.CART_SESSION_ID, {})

    
    def add(self, product, quantity=1, override_quantity=False):
        product_id = str(product.id)
        cart_item = self.cart.setdefault(product_id, {'price': str(product.price), 'quantity': 0, 'title': product.title, 'img': str(product.img)})

        if override_quantity:
            cart_item['quantity'] = quantity
        else:
            cart_item['quantity'] += quantity

        cart_item['subtotal'] = str(self.get_sub_total(product.price, cart_item['quantity'])) 
        self.save()

    def save(self):
        self.session[settings.CART_SESSION_ID] = self.cart
        self.session.modified = True
    
    def remove(self, product):
        product_id = str(product.id)
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()


    def __len__(self):
        return sum(item['quantity'] for item in self.cart.values())

    def get_sub_total(self, price, quantity):
        return quantity * price
    
    def get_total(self):
        return sum(float(item['price']) * float(item['quantity']) for item in self.cart.values())

    def clear(self):
        """Clear all items from the cart."""
        self.cart = {}
        self.save()
