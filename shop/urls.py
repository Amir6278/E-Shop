from django.urls import path,include
from. import views  
urlpatterns = [
    path('',views.home,name="home"),
    path('cat/<int:id>',views.cat_product,name="cat_product"),
    path('product/<int:id>',views.product_type,name="product_type"),
    path('product-detail/<int:id>',views.product_detail,name="productdetail"),
    path('addcart/',views.add_cart),
    path('cart/',views.cart,name="cart"),
    path('pluscart/',views.plus_cart,name="pluscart"),
    path('minuscart/',views.minus_cart,name="minuscart"),
    path('delcart/',views.del_cart,name="delcart"),
    path('checkout/',views.checkOut,name="checkout"),
    path('order/',views.order_detail,name="order"),
    path('order_placed/',views.order_placed,name="order_placed")
    ]
    

