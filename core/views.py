from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required, user_passes_test
import time
from rest_framework import viewsets
from .serializers import *
import requests
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt


#FUNCION QUE VALIDA EL GRUPO
def grupo_requerido(nombre_grupo):
      def decorator(view_func):
            @user_passes_test(lambda user: user.grup.filter(name=nombre_grupo).exists())
            def wrapper(request, *args, **kwargs):
                return view_func(request, *args, **kwargs)
            return wrapper
      return decorator 
                  
      
#TRANSFORMACION
class ProductoViewSet(viewsets.ModelViewSet):
      #FILTRO queryset = Producto.objets.filter(tipo=1)
      queryset = Producto.objects.all()
      serializer_class = ProductoSerializers

class TipoProductoViewSet(viewsets.ModelViewSet):
      queryset = TipoProducto.objects.all()
      serializer_class = TipoProductoSerializers

class UsuarioViewSet(viewsets.ModelViewSet):
      queryset = User.objects.all()
      serializer_class = UsuarioSerializers

class GrupoViewSet(viewsets.ModelViewSet):
      queryset = Group.objects.all()
      serializer_class = GrupoSerializers

# Create your views here.

def index(request):
	return render(request, 'core/index.html')



def detalle(request):
	return render(request, 'core/detalle.html')

def historialcompras(request):
	return render(request, 'core/historialcompras.html')

def modificarestado(request):
	return render(request, 'core/modificarestado.html') 

def comprasusuarios(request):
	return render(request, 'core/comprasusuarios.html')      

def about(request):
    trabajadorAll = Trabajador.objects.all() #select * from producto   

    data = {
        'listado': trabajadorAll,
    }

    return render(request, 'core/about.html', data)

@login_required
def cart(request):
    #for item in request.user.carrito.itemcarrito_set.all:
     #   total = total + item.producto.precio
    return render(request, 'core/cart.html')

def checkout(request):
    respuesta = requests.get('https://mindicador.cl/api/dolar')
    monedas = respuesta.json()
    valor_usd = monedas['serie'] [0] ['valor']
    valor_carrito = 20000
    valor_total = valor_carrito/valor_usd

    data = {
          'valor' : round(valor_total,2)
    }
    return render(request, 'core/checkout.html')

def contact(request):
	return render(request, 'core/contact.html')

def contact(request):
	return render(request, 'core/contact.html')

def news(request):
	return render(request, 'core/news.html')

def shopapi(request):
    
    respuesta = requests.get(' http://localhost:8000/api/Productos/')
    respuesta2 = requests.get('https://mindicador.cl/api')

    variable1 = respuesta.json()
    variable2 = respuesta2.json()
    
    data = {
         'listado' : variable1,
         'moneda' : variable2,
    }

    return render(request, 'core/shopapi.html', data)

#Contiene un listar de productos
@login_required
def shop (request):
    productosAll = Producto.objects.all() #select * from producto
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(productosAll, 3)
        productosAll = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': productosAll,
        'paginator': paginator
    }

   
    
    return render(request, 'core/shop.html', data)

def singlenews (request):
	return render(request, 'core/singlenews.html')

def singleproduct (request):
	return render(request, 'core/singleproduct.html')

#Zona CRUD
def add(request):
    data = {
        'form' : ProductoForm()
    }
    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto almacenado correctamente"
            messages.success(request, "Producto almacenado correctamente")

    return render(request, 'core/add-product.html', data)

def update(request,id):
    producto = Producto.objects.get(id=id) 
    data = {
        'form' : ProductoForm(instance=producto)
    }

    if request.method == 'POST':
        formulario = ProductoForm(data=request.POST, instance=producto, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto modificado correctamente"
            messages.success(request, "Producto actualizado correctamente")
            data['form'] = formulario 

    return render(request, 'core/update-product.html', data)

def delete(request,id):
    producto = Producto.objects.get(id=id) # Buscamos un producto por su id.
    producto.delete()

    return redirect(to="shop")


#CRUD CARRITO

def agregar_al_carrito(request, producto_id):
    producto = get_object_or_404(Producto, pk=producto_id)
    carrito, created = Carrito.objects.get_or_create(usuario=request.user)
    item, item_created = ItemCarrito.objects.get_or_create(carrito=carrito, producto=producto)
    if not item_created:
        item.cantidad += 1
        item.save()
    producto.disminuir_stock(1)
    return redirect(to="cart")

def eliminar_del_carrito(request, itemcarrito_id):
    item = get_object_or_404(ItemCarrito, pk=itemcarrito_id, carrito__usuario=request.user)

    # Obtener el producto asociado al ítem eliminado
    producto = item.producto

    # Incrementar la cantidad disponible en el stock del producto
    producto.stock += item.cantidad

    # Guardar los cambios en el producto
    producto.save()

    # Eliminar el item del carrito
    item.delete()

    return render(request, 'core/cart.html')


def vista_ejemplo(request):
    precio = item.producto.precio
    return render(request, 'core/cart.html', {'precio': precio})


def register(request):
    form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
             form.save()
             return redirect("index")
    return render(request, 'registration/register.html', { 'form': form })




def suscribirse(request):
    form = SubscripcionForm(request.POST)
    if request.method == 'POST':
        if form.is_valid():
            suscribirse = form.save()
            # hacer algo con los datos del suscripto
            return redirect('index')
    else:
        form = SubscripcionForm()

    return render(request, 'registration/suscribirse.html', {'form': form})

#CRUD Trabajadores
def add_trabajador(request):
    form = SegundoCrudForm()
    data = {
        'form' : form
    }
    if request.method == 'POST':
        formulario = SegundoCrudForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto almacenado correctamente"
            messages.success(request, "Trabajador registrado correctamente")

    return render(request, 'core/add-trabajador.html', data)

def update_trabajador(request,id):
    trabajador = Trabajador.objects.get(id=id) 
    data = {
        'form' : SegundoCrudForm(instance=trabajador)
    }

    if request.method == 'POST':
        formulario = SegundoCrudForm(data=request.POST, instance=trabajador, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto modificado correctamente"
            messages.success(request, "Trabajador actualizado correctamente")
            data['form'] = formulario 

    return render(request, 'core/update-trabajador.html', data)

def delete_trabajador(request,id):
    trabajador = Trabajador.objects.get(id=id) # Buscamos un producto por su id.
    trabajador.delete()

    return redirect(to="about")




#MILKO POR TERMINAR (SOLO CAMBIAR VARIABLES Y CREAR LOS HTML)
#REGISTRAR COMPRA DEL USUARIO
#@grupo_requerido('Cliente')
#def compra_usuario(request):
#     carro_compras = CarroCompras.objets.get(usuario=request.user)
#     total_carro = carro_compras.total()

#     compra = Compra.objects.create(usuario=request.user, total=total_carro, estado='Validacion')

#    for item in carro_compras.items.all():
#        producto = item.producto
#        cantidad = item.cantidad
#        subtotal= item.calcularTotal

#        producto_carrito = ProductoCarrito.objects.create(compra=compra, producto=producto, cantidad=cantidad, subtotal=subtotal)
#        item.delete()
#    carro_compras.item.clear()

#    return redirect('detalle')

#DETALLE DE LA COMPRA (5% IMPLEMENTADO)
#@grupo_requerido('Cliente')
#def boleta(request, id):
#     compra = Compra.objets.get(id=id)
#     items = compra.productocarrito_set.all()

#    total_compra = round(compra.total*0,95) + 2000
#    total_productos = 0

#    subtotal = round(compra.total*0,95)
#    for x in items:
#        total_productos += x.producto.precio * x.cantidad
#        x.total_productos = total_productos

#        total_productos = 0

#        precio_rebajado = round(x.prodcuto.precio * 0.95)
#        x.precio_rebajado = precio_rebajado

#        total_rebaja = precio_rebajado * x.cantidad
#        x.total_rebaja = total_rebaja

#    data = {
#         'compra' : compra,
#         'items' : items,
#         'total_compra' : total_compra
#         'subtotal' : subtotal,
#    }

#    return render (request, 'core/detalle.html', data)

#HISTORIAL DE COMPRAS DEL USUARIO
#@grupo_requerido('Cliente')
#def historialcompras(request):
#     compras = Compra.objects.filter(usuario=request.user)

#    for x in compras:
#          total_descuento = round(x.total * 0.95) + 2000
#          x.total_descuento = total_descuento

#          total_compra = x.total + 2000
#          x.total_compra = total_compra

#    data = {
#         'compras' : compras,
#    }

#    return render(request, 'core/historialcompras.html', data)

#VER COMPRA DE LOS USUARIOS
#@grupo_requerido('Vendedor')
#def comprasusuarios(request):
#     compras = Compra.objects.all()

#     data = {
#          'compras' : compras,
#     }

#     return render(request, 'core/compras.html' , data)

#MODIFICAR ESTADO DE LA COMPRA
#@grupo_requerido('Vendedor')
#def modificarestado(request, id):
#    compra = Compra.objets.get(id=id)

#     if request.method == 'POST':
#        nuevo_estado = request.POST.get('nuevo_estado')
#        compra.estado = nuevo_estado
#        compra.save()
#        messages.info(request, "Nuevo Estado Modificado")

#    data = {
#         'compra' : compra,
#    }

#    return render(request, 'core/modificarestado.html', data)
