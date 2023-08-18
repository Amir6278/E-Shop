from django.contrib import admin
from .models import(
    Category,Product,Attribute,AttributeValue,Inventory,StockControl,Image,order
)
# Register your models here.
class productImageInline(admin.TabularInline):
    model = Image


class AttributeValueInline(admin.TabularInline):
    model = AttributeValue

class StockControlInline(admin.TabularInline):
    model = StockControl




@admin.register(Inventory)
class InventoryAdmin(admin.ModelAdmin):
   inlines = [productImageInline,StockControlInline]
   list_display = ('id','name','des','price','cat_name','product_type','attrs','attrc','is_active','stock_available')
   list_display_links =('id','name','product_type','cat_name')
  

@admin.register(Attribute)
class AttributeAdmin(admin.ModelAdmin):
    list_display = ('id','name','description')

    inlines = [AttributeValueInline]


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id','name','slug','is_active')
    prepopulated_fields = {
        "slug" : ("name",),
    }

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('id','name','description','cat_name','available_Item','is_active')
    prepopulated_fields = {
        "slug" : ("name",),
    }
    

# admin.site.register(Image)
@admin.register(order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('user_name','address','product_name','unit','unit_total','time')