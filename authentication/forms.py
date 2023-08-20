from dataclasses import fields
from socket import fromshare
from django import forms
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.contrib.auth.models import User
from .models import user_profile

#registration

class Registration(UserCreationForm):
    username = forms.CharField()
    email = forms.EmailField(required=True)
    class Meta:
        model = User
        fields = ['username','email','password1','password2']
    

class Userlogin(AuthenticationForm):
   password = forms.CharField(widget=forms.PasswordInput())
   class Meta:
        model = User
        fields= ['username','password1']



class ProfileForm(forms.ModelForm):
    # user_img = forms.ImageField(label='Profile Photo')
    # ip = forms.CharField(widget=forms.TextInput(attrs={'readonly':'readonly'}))
    last_login = forms.DateTimeField(widget=forms.TextInput(attrs={'readonly':'readonly'}))
    class Meta:
        model = user_profile
        fields = ['username','first_name','last_name','email','address','number','last_login']
        widgets = {
            'username':forms.TextInput(attrs={'class':'form-control'}),
            'first_name':forms.TextInput(attrs={'class':'form-control'}),
            'last_name':forms.TextInput(attrs={'class':'form-control'}),
            'email':forms.EmailInput(attrs={'class':'form-control'}),
            'address':forms.TextInput(attrs={'class':'form-control','row':'10'}),
            'number':forms.NumberInput(attrs={'class':'form-control'}),
            'last_login':forms.DateTimeInput(attrs={'class':'form-control'}),
           
        }