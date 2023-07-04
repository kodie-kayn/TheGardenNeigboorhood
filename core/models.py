from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

# Create your models here.

class TipoProducto(models.Model):
    descripcion = models.CharField(max_length=50)

    def str(self):
        return self.descripcion

class Producto(models.Model):
    nombre = models.CharField(max_length=50)
    precio = models.IntegerField()
    stock = models.IntegerField()
    tipo = models.ForeignKey(TipoProducto, on_delete=models.CASCADE)
    descripcion = models.CharField(max_length=250)
    vencimiento = models.DateField()
    imagen = models.ImageField(null=True,blank=True)

    def str(self):
        return self.nombre
    
    def descuento(self):
        return round(self.precio - (self.precio * 0.1))
    
    def disminuir_stock(self, cantidad):         
        self.stock -= cantidad         
        self.save()
    
class Carrito(models.Model):
    usuario = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    productos = models.ManyToManyField(Producto, through='ItemCarrito')

    def _str_(self):
        return f"Carrito de {self.usuario.username}"
    
    
class ItemCarrito(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def _str_(self):
        return f"{self.producto.nombre} - {self.carrito.usuario.username}"
    
    def preciototal(self):
        return self.cantidad * self.producto.precio
    
    def calcularDescuentoCarro(self):
        return round(self.producto.precio - (self.producto.precio * 0.1))
    
    def preciototalsuscriptor(self):
        return round(self.producto.precio - (self.producto.precio * 0.1)) * self.cantidad
    
class Trabajador(models.Model):
    nombre_trabajador = models.CharField(max_length=50)
    descripcion_trabajador = models.CharField(max_length=250)
    imagen_trabajador = models.ImageField(null=True,blank=True)

    def str(self):
        return self.nombre    

class suscribirse(models.Model):
    name = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    monto = models.PositiveIntegerField()

    def __str__(self):
        return self.email
    
