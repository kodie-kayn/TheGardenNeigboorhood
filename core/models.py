from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
import uuid

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
    
class SeguimientoOrden(models.Model):
    estado = models.CharField(max_length=100)

    def __str__(self):
        return self.estado
    
class Orden(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    numero = models.CharField(max_length=36, unique=True, default=uuid.uuid4)
    fecha = models.DateTimeField(auto_now_add=True)
    estado = models.ForeignKey(SeguimientoOrden, on_delete=models.CASCADE, default=1)
    productos = models.ManyToManyField(Producto, through='ItemOrden')

    def __str__(self):
        return f"Orden #{self.id}"
    
    
    def calcularTotal(self):
        items = self.itemorden_set.all()
        total = 0

        for item in items:
            total += item.precio_total()
        
        return total
        
    def calcular_cantidad(self):
        items = self.itemorden_set.all()
        total = 0

        for item in items:
            total += item.cantidad
        
        return total
    
    def calcular_total_suscritor(self):
        items = self.itemorden_set.all()
        total = 0

        for item in items:
            total += item.precio_total_suscritor()
        
        return total

class ItemOrden(models.Model):
    orden = models.ForeignKey(Orden, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"{self.producto.nombre} - {self.orden.carrito.usuario.username}"

    def precio_total(self):
        return self.cantidad * self.producto.precio
    
    def calcularDescuentoCarrito(self):
        return round(self.producto.precio - (self.producto.precio * 0.05))
    
    def precio_total_suscritor(self):
        return round(self.producto.precio - (self.producto.precio * 0.05)) * self.cantidad    
 

