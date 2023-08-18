from django.db import models
from django.contrib.auth.models import User



class user_profile(User):
    user = models.OneToOneField(User,on_delete=models.CASCADE,related_name='userProfile')
    address = models.TextField()
    number = models.CharField(max_length=20)
    ip = models.CharField(max_length=50,null=True)
    img = models.ImageField(upload_to="Image/")
