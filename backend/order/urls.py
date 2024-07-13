from django.urls import path
from .views import send_order

urlpatterns = [
    path('send-order/', send_order)
]