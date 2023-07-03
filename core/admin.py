from django.contrib import admin
from .models import *
from usuario.models import *

# Register your models here.

#Para que en el admin se visualice como tabla.
class ProductoAdmin(admin.ModelAdmin):
    list_display = ['nombre','precio','stock','tipo','descripcion','vencimiento','imagen']
    search_fields = ['nombre']
    list_per_page = 10
    list_filter = ['tipo']
    list_editable = ['precio','stock','tipo','descripcion','vencimiento','imagen']

class TipoProductoAdmin(admin.ModelAdmin):
    list_display = ['descripcion']

class TrabajadorAdmin(admin.ModelAdmin):
    list_display = ['nombre_trabajador','descripcion_trabajador','imagen_trabajador']
    search_fields = ['nombre_trabajador']
    list_per_page = 10
    list_editable = ['descripcion_trabajador','imagen_trabajador']    

admin.site.register(TipoProducto, TipoProductoAdmin)   
admin.site.register(Producto, ProductoAdmin)
admin.site.register(Trabajador, TrabajadorAdmin)
admin.site.register(Carrito)
admin.site.register(ItemCarrito)
admin.site.register(suscribirse)
admin.site.register(usuariopersonalizado)
