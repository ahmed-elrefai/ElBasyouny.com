from django.urls import path
from .views import *

urlpatterns = [
    path('', home, name='home'),
    path('products/', ProductsView.as_view(), name='products'),
    path('customers/', CustomersView.as_view(), name='customers'),
    path('categories/', CategoriesView.as_view(), name='categories'),
    path('orders/', OrdersView.as_view(), name='orders'),
    path('products/<str:category>/', ProductsByCategoryView.as_view(), name='products_by_category'),
    path('products/<str:category>/<int:number>',ProductsByCategoryLimited.as_view(), name='limited_products_by_category'),
    path('products/get/<int:number>/', ProductsLimited.as_view(), name='get_latest'),
]