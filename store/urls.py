from django.urls import path,re_path
from .views import *
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(
        title="Store API",
        default_version='v1',
        description="Store API Documentation",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="elrefaayahmed196@gmail.com"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('', home, name='home'),
    path('products/', ProductsView.as_view(), name='products'),
    path('customers/', CustomersView.as_view(), name='customers'),
    path('categories/', CategoriesView.as_view(), name='categories'),
    path('orders/', OrdersView.as_view(), name='orders'),
    path('products/<str:category>/', ProductsByCategoryView.as_view(), name='products_by_category'),
    path('products/<str:category>/<int:number>',ProductsByCategoryLimited.as_view(), name='limited_products_by_category'),
    path('products/get/<int:number>/', ProductsLimited.as_view(), name='get_latest'),
    # API Swagger Docs
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),

]