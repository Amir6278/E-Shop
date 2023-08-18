from django.shortcuts import render,HttpResponseRedirect,HttpResponse
from django.http import JsonResponse
from .models import Category,Product,Inventory,Image,Cart,order
from authentication.models import user_profile
from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.contrib import messages
import random



def home(request):
    category = Category.objects.all()
    citem=0
    if request.user.is_authenticated:
      citem = len(Cart.objects.filter(user=request.user))
    products = Product.objects.all()
    item = Inventory.objects.all()
    pagi = Paginator(item,8)
    page_num = request.GET.get('page')
    page_obj = pagi.get_page(page_num)
    context = {'product':products,'category':category,'inventory':page_obj,'all':'active','c':citem}
    return render(request,'home.html',context)


def cat_product(request,id):
   category = Category.objects.all()
   citem=0
   if request.user.is_authenticated:
      citem = len(Cart.objects.filter(user=request.user))
   products = Product.objects.all()
   cat_item = Inventory.objects.filter(category_id=id)
   pagi = Paginator(cat_item,8)
   page_num = request.GET.get('page')
   page_obj = pagi.get_page(page_num)
   context ={'product':products,'category':category,'inventory':page_obj,'id':id,'active':'active','c':citem}
   return render(request,'home.html',context)


def product_type(request,id):
   category = Category.objects.all()
   citem=0
   if request.user.is_authenticated:
      citem = len(Cart.objects.filter(user=request.user))
   products = Product.objects.all()
   item = Inventory.objects.filter(product_id=id)
   cat_id = item[0].category_id
   pagi = Paginator(item,8)
   page_num = request.GET.get('page')
   page_obj = pagi.get_page(page_num)
  
   context = {'product':products,'category':category,'inventory':page_obj,'id':cat_id,'pid':id,'active':'active','c':citem}
   return render(request,'home.html',context)
 

def product_detail(request,id):
  products = Product.objects.all()
  citem=0
  item_cart = False
  if request.user.is_authenticated:
      citem = len(Cart.objects.filter(user=request.user))
      item_cart = Cart.objects.filter(inventory=id,user=request.user).exists()
  data = Inventory.objects.get(pk=id)
  print(item_cart)
  cart = None
  if item_cart:
    cart = Cart.objects.get(inventory=id,user=request.user)
  
  p_id = data.product_id
  allData = Inventory.objects.filter(product_id=p_id).exclude(pk=id)
#   moreData =  allData.difference(data)
  context = {
   'data':data,'product':products,
   'more':allData,
   'item_cart':item_cart,
   'cart':cart,
   'selected':'checked',
   'c':citem,
  }
  print(cart)
  return render(request,'product.html',context)


def add_cart(request):
   if request.user.is_authenticated:
      if request.method == "POST":
         a = request.POST.get('btn',False)
         u = request.POST.get('btnU',False)
         inventory_id = request.POST['inventory_id']
         print('status',u)
         size = request.POST.get('size',False)
         color = request.POST.get('color',False)
      # print(inventory_id,size,color)
      if a:
         c = Cart(size=size,color=color,inventory=Inventory(pk=inventory_id),user=request.user)
         print(c)
         c.save()
      elif u:

         c = Cart.objects.filter(inventory=inventory_id).update(size=size,color=color)
      return HttpResponseRedirect('/cart/')
   return HttpResponseRedirect('/login/')



def cart(request):
   if request.user.is_authenticated:
      data = Cart.objects.filter(user_id=request.user.id)
      citem = len(Cart.objects.filter(user=request.user))
      temp = 0
      total = 0
      for item in data:
         temp = item.quantity * item.inventory.price
         total += temp 
      # print(total)
      return render(request,'cart.html',{'data':data,'carttotal':total,'c':citem})



def plus_cart(request):
   inven_id = request.GET.get('inven_id')
   allcart = Cart.objects.filter(user_id=request.user.id)
   print(request.user.id)
   item = Cart.objects.get(pk=inven_id)
   item.quantity += 1
   item.save()
   print(item.quantity)
   temp = 0
   total = 0
   for item in allcart:
      temp = item.quantity * item.inventory.price
      total += temp 

   data ={

      'quantity' : item.quantity,
      'total':total,
   }
   return JsonResponse(data)

def minus_cart(request):
   allcart = Cart.objects.filter(user_id=request.user.id)
   inven_id = request.GET.get('inven_id')
   print(request.user.id)
   item = Cart.objects.get(pk=inven_id)
   if item.quantity == 1:
      return HttpResponseRedirect('/delcart/')
   item.quantity -= 1
   item.save()
   # print(inven_id)
   temp = 0
   total = 0
   for item in allcart:
      temp = item.quantity * item.inventory.price
      total += temp
   print(item.quantity)
   data ={
      'quantity' : item.quantity,
      'total' : total,
   }
   return JsonResponse(data)



def del_cart(request):
   inven_id = request.GET.get('id')
   item = Cart.objects.get(pk=inven_id)
   item.delete()
   data ={
      'item' : 'Deleted'
   }
   
   return JsonResponse(data)



def checkOut(request):
   data = Cart.objects.filter(user=request.user)
   items = len(data)
   temp = 0
   total = 0
   for item in data:
      temp = item.quantity * item.inventory.price
      total += temp
   
   return render(request,'checkout.html',{'data':data,'c':items,'total':total})


def order_detail(request):
   if request.method == "POST":
      user_id = request.user.id
      name = request.POST['name']
      address = request.POST.get('location',False)
      fulltotal = request.POST.get('fulltotal',False)
      print(user_id)
      products = Cart.objects.filter(user_id=user_id)
      print(products)
      order_code = random.randint(1111,9999)
      for product in products:
         inven_id = product.inventory.id
         product_name = product.inventory.name
         unit = product.quantity
         unit_total = product.quantity * product.inventory.price
         NewOrder = order(user_name=name,address=address,product_name=product_name,unit=unit,unit_total=unit_total,product_id=Inventory(pk=inven_id),user_id=User(pk=request.user.id),order_code=order_code)
         print('k')
         NewOrder.save()
         product.delete()
      messages.success(request,'Your order has successfully placed, Order Code '+ str(order_code))
   return HttpResponseRedirect('/order_placed/')



def order_placed(request):
   orders = order.objects.filter(user_id=request.user.id)
   total = 0
   for o in orders:
      total += o.unit_total
      print(o.status)
      if o.status == 'delivered':
         o.delete()
   order_items = len(orders)
   context = {
      'item': order_items,
      'data' :orders,
      'price':total,
   }
   return render(request,'order.html',context)