from pydoc import describe
from django.db import models
from django.contrib.auth.models import User
from authentication.models import user_profile

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=50)
    slug = models.SlugField()
    is_active = models.BooleanField()
    class Meta:
        verbose_name_plural = 'Categories'
    def __str__(self):
        return str(self.name)

class Product(models.Model):
    class Meta:
        verbose_name_plural = 'Sub-Categories'
    name = models.CharField(max_length=70)
    description = models.TextField()
    slug = models.SlugField()
    is_active = models.BooleanField()
    category = models.ManyToManyField(Category)
    def __str__(self):
        return str(self.name)

    def cat_name(self):
        return ",".join([ str(p) for p in self.category.all()])
    
    def available_Item(self):
        return str(len(self.productType.all()))


attr_choice = (
    ('size','size'),
    ('color','color')
)

class Attribute(models.Model):
    name = models.CharField(max_length=100,choices=attr_choice )
    description = models.TextField()
    def __str__(self):
        return self.name

class AttributeValue(models.Model):
    value = models.CharField(max_length=60)
    attribute = models.ForeignKey(Attribute,related_name='AttributeKey',on_delete=models.CASCADE)
    def __str__(self):
        return self.value



class Inventory(models.Model):
    name = models.CharField(max_length=50,null=True)
    des = models.TextField(default="Good Quality")
    is_active = models.BooleanField()
    is_default = models.BooleanField()
    price = models.DecimalField(
        max_digits = 20,
        decimal_places= 2,
    )
    created_at = models.DateTimeField(auto_now_add=True,editable=False)
    #sku = models.CharField(max_length=20,unique=True)
    product = models.ForeignKey(Product,related_name="productType",on_delete=models.CASCADE)
    category = models.ForeignKey(Category,on_delete=models.CASCADE)
    attribute = models.ManyToManyField(AttributeValue)
    class Meta:
        verbose_name_plural = 'Products'
    def product_type(self):
        return self.product.name
     
    def cat_name(self):
        return str(self.category.name)
    def attrs(self):
        return [str(p) for p in self.attribute.all() if p.attribute.name=='size']
    def attrc(self):
        return [str(p) for p in self.attribute.all() if p.attribute.name=='color']
    def stock_available(self):
        return self.stock.units
    
    def img_url(self):
        return [str(p) for p in self.ImgUrl.all() if p.is_feature!=1]

    def feature_img(self):
        for p in self.ImgUrl.all():
            if p.is_feature==1:
                return p.url
        #return ",".join([str(p) for p in self.ImgUrl.all() if p.is_feature==1])

class StockControl(models.Model):
    last_checked = models.DateTimeField(auto_now_add=True,editable=False)
    units = models.IntegerField(null=False)
    Inventory = models.OneToOneField(Inventory,related_name="stock",on_delete=models.CASCADE)
    class Meta:
        verbose_name_plural = 'Stock'

    def __str__(self):
        return str(self.units)
    


class Image(models.Model):
    url = models.ImageField(upload_to="Image")
    alternattext = models.CharField(max_length=50,null=True)
    is_feature = models.BooleanField()

    inventory = models.ForeignKey(Inventory,related_name="ImgUrl",on_delete=models.CASCADE)

    def __str__(self):
        return str(self.url) 



class Cart(models.Model):
    inventory = models.ForeignKey(Inventory,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    size = models.CharField(max_length=11)
    color = models.CharField(max_length=11)
    quantity = models.IntegerField(default=1)





order_status = (
    ('placed','Placed'),
    ('accepted','Accepted'),
    ('on the way','on the way'), 
    ('delivered','Delivered')
)

class order(models.Model):
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    user_name = models.CharField(max_length=100)
    order_code = models.IntegerField(null=True)
    address = models.TextField()
    product_id = models.ForeignKey(Inventory,on_delete=models.CASCADE)
    product_name = models.CharField(max_length=100)
    unit = models.IntegerField(default="1")
    unit_total = models.DecimalField(max_digits=20,decimal_places=2)
    time = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=200,choices=order_status,default="Placed")
    