from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

# Creamos un template de un formulario en base al modelo
class ProductoForm(ModelForm):
    nombre = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    precio = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Precio"}))
    stock = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Stock"}))
    descripcion = forms.CharField(min_length=10,max_length=200,widget=forms.Textarea(attrs={"rows":4}))

    class Meta:
        model = Producto
        fields = '__all__'

        widgets = {
            'vencimiento' : forms.SelectDateWidget(years=range(2023,3000))
        }

class LoginForm(forms.Form):
    username = forms.CharField(max_length=65)
    password = forms.CharField(max_length=65, widget=forms.PasswordInput)


class RegisterForm(UserCreationForm):
    class Meta:
        model=User
        fields = ['username','email','password1','password2']

class SegundoCrudForm(ModelForm):
    nombre_trabajador = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    descripcion_trabajador = forms.CharField(min_length=10,max_length=250,widget=forms.Textarea(attrs={"rows":4}))

    class Meta:
        model = Trabajador
        fields = '__all__'

class SubscripcionForm(forms.ModelForm):
    class Meta:
        model = suscribirse
        fields = ['name','apellido','email',  'monto']