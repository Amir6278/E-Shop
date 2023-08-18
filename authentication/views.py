
from tkinter import DISABLED
from django.shortcuts import render,HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.views import View

from authentication.models import user_profile
from .forms import Registration,Userlogin,ProfileForm
from django.contrib.auth import authenticate,login,logout,update_session_auth_hash
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect


class UserRegistration(View):
    def get(self,request):
        fm = Registration()
        return render(request,'registration.html',{'form':fm})
    def post(self,request):
        fm = Registration(request.POST)
        if fm.is_valid():
            nm = fm.cleaned_data['username']
            email = fm.cleaned_data['email']
            email_exists = User.objects.filter(email=email)
            if email_exists:
                messages.error(request,'User email Already Exists!')
            else:
              password = make_password(fm.cleaned_data['password2'])
              regi = User(username=nm,email=email,password=password)
              regi.save()
              messages.success(request,'Registation successfull.Log In with your credentials')
        else:
            messages.warning(request,'Fill Up with valid data')
        return render(request,'registration.html',{'form':fm})



class user_login(View):
    def get(self,request):
        fm = Userlogin()
        return render(request,'login.html',{'form':fm})

    def post(self,request):
        fm = Userlogin(request.user,data=request.POST)
        uemail = request.POST['email']
        userMail = User.objects.filter(email=uemail).exists()
        # print(userMail.username)
        # request.POST['username'] = userMail.username
        if userMail:
                 uname = User.objects.get(email=uemail).username
                 pasword = request.POST['password']
                 user = authenticate(username=uname,password=pasword)
                 if user is not None:
                     login(request,user)
                     return HttpResponseRedirect('/')
                 else:
                     messages.error(request,'Invalid Credentials!')
        else:
            messages.error(request,'Invalid Credentials!')
        return render(request,'login.html',{'form':fm})



def log_out(request):
    logout(request)
    return HttpResponseRedirect('/login/')

    


class profile(View):
    def get(self,request):
       data=None
       data = user_profile.objects.get(user_id=request.user.id)
       context = {
        'username': data.username,
        'email': data.email,
        'address': data.address,
        'number': data.number,
        'last_login' : data.last_login,
         } 
       fm = ProfileForm(initial=context)
       return render(request,'profile.html',{'form':fm,'user_img':data.img})
    
    def post(self,request):
        
        fm = ProfileForm(request.POST,request.FILES)
        unm=request.POST['username']
        uemail = request.POST['email']
        uadd = request.POST['address']
        unumber = request.POST['number']
        ufm = request.POST['first_name']
        ulm = request.POST['last_name']
        # img = request.FILES.get('img',False)
        u = user_profile.objects.filter(user_id=request.user.id).update(username=unm,email=uemail,address=uadd,number=unumber)
        if u:
           
            messages.info(request,'Profle Updated Succcessfully!!')
        return render(request,'profile.html',{'form':fm})