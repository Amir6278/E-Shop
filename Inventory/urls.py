
from django.contrib import admin
from django.conf import settings
from django.urls import path,include
from django.conf.urls.static import static
from shop import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include('shop.urls')),
    path('',include('authentication.urls')),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
