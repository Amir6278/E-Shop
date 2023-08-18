from django.urls import path,include
from .import views 
urlpatterns = [
        path('registration/',views.UserRegistration.as_view(),name="registration"),
        path('login/',views.user_login.as_view(),name="login"),
        path('logout/',views.log_out,name="logout"),
        path('profile/',views.profile.as_view(),name="profile"),
      
    
    ]
    

