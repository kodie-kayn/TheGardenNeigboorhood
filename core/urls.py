from django.urls import path, include
from .views import *
from rest_framework import routers

#CREACION RUTA API
router = routers.DefaultRouter()
router.register('Productos', ProductoViewSet ) 
router.register('Tipoproductos', TipoProductoViewSet ) 
router.register('Usuario', UsuarioViewSet ) 
router.register('Grupo', GrupoViewSet ) 



urlpatterns = [
    #API
    path('api/', include(router.urls)),

    path('', index, name="index"),    
    path('detalle.html', detalle, name="detalle"), 
    path('historialcompras.html', historialcompras, name="historialcompras"),
    path('modificarestado.html', modificarestado, name="modificarestado"),      
    path('about.html/', about, name="about"),   
    path('cart.html/', cart, name="cart"),
    path('checkout.html/', checkout, name="checkout"),
    path('contact.html/', contact, name="contact"),
    path('news.html/', news, name="news"),
    path('shop.html/', shop, name="shop"),
    path('shopapi.html/', shopapi, name="shopapi"),
    path('singlenews.html/', singlenews, name="singlenews"),
    path('singleproduct.html/', singleproduct, name="singleproduct"),

    #Zona CRUD
    path('add/', add, name="add"),
    path('update-product/<id>/', update, name="update"),
    path('delete/<id>/', delete, name="delete"),
    
    #CRUD CARRITO
    path('agregar/<producto_id>/', agregar_al_carrito, name='agregar_al_carrito'),
    path('eliminar_del_carrito/<itemcarrito_id>/', eliminar_del_carrito, name='eliminar_del_carrito'),
    
    #REGISTRO USUARIO
    path('register/', register, name="register"),
    #SUSCRIPCION
    path('suscribirse/', suscribirse, name="suscribirse"),
    #CRUD Trabajadores
    path('add_trabajador/', add_trabajador, name="add_trabajador"),
    path('update_trabajador/<id>/', update_trabajador, name="update_trabajador"),
    path('delete_trabajador/<id>/', delete_trabajador, name="delete_trabajador"),

    #Suscripcion
    path('activarsuscriptor/', activarsuscriptor, name='activarsuscriptor'),
    path('desactivarsuscriptor/', desactivarsuscriptor, name='desactivarsuscriptor'),

    #Orden
    path('crear_orden/', crear_orden, name='crear_orden'),
    path('boleta/<numero_orden>', boleta, name='boleta'),

    #Seguimiento
    path('seguimiento/', seguimiento, name="seguimiento"),
    path('estadocompra/', estadocompra, name='estadocompra'),

    path('panel_admin/', panel_admin, name="panel_admin"),
    path('cambiar_estado/<str:numero_orden>/', cambiar_estado, name="cambiar_estado"),
]

