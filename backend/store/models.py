from django.db import models
import datetime


class Category(models.Model):
    name = models.CharField(max_length=50)
    def __str__(self) -> str:
        return self.name
    
    class Meta:
          verbose_name_plural = 'categories'
    
class Customer(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone = models.CharField(max_length=10)
    email = models.EmailField(max_length=100)
    password = models.CharField(max_length=100)
 
    def __str__(self) -> str:
            return f"{self.first_name} {self.last_name}"
    

class Product(models.Model):
    title = models.CharField(max_length=100)
    price = models.DecimalField(default=0, decimal_places=2, max_digits=6)
    category =  models.ForeignKey(Category, on_delete=models.CASCADE, default=1)
    description = models.CharField(max_length=250, default='', blank=True, null=True)
    img = models.ImageField(upload_to='uploads/products/')
    
    def __str__(self) -> str:
            return self.title

class Order(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE) 
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    address = models.CharField(max_length=100, default ='' , blank=True) 
    phone = models.CharField(max_length=20, default='', blank=True)
    date =  models.DateField(default=datetime.datetime.today)
    status = models.BooleanField(default=False)
    def __str__(self) -> str:
            return f"{self.product} | {self.address}"