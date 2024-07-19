from django.urls import path
from .views import *

urlpatterns = [
    # path('', cart),
    path('show-cart/', show_cart, name="show_cart"), # this is a tempo cart view in static html
    path('add/<int:product_id>/', add_to_cart, name="add_to_cart"),
    path('update/<str:item_id>/', update_quantity, name='update_quantity'),
    path('remove/<int:product_id>/', remove_item, name="remove_item"),
    path('confirm-order/', confirm_order, name='confirm_order'),
]