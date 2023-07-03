from core.models import TipoProducto, Producto
from rest_framework import serializers
from django.contrib.auth.models import User, Group


class TipoProductoSerializers(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'


class ProductoSerializers(serializers.ModelSerializer):
    tipo = TipoProductoSerializers(read_only=True)
    class Meta:
        model = Producto
        fields = '__all__'

class UsuarioSerializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class GrupoSerializers(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = '__all__'