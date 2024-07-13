from django.shortcuts import render
from .order import Order
# Create your views here.

def send_order(request):
    order = Order("1 رز بلبن | 3 لبن لمار","El Maady")
    order.send_order()