$(document).ready(function () {
    
    $('.plus-cart').click(function(event){
        event.preventDefault();
        var id = $(this).attr('pid').toString()
        console.log(id)
        molom = this.parentNode.parentNode.children[1].children[0]
       // console.log(this.parentNode.parentNode.children[1].children[0])
        var eml = this
        $.ajax({
            method:"GET",
            url:"/pluscart",
            data:{
                inven_id : id
            },
            success:function(data){
             console.log(data)
            
            document.getElementById('total').innerText = data.total
            molom.innerText = data.quantity
            }
    
        })
    
    })
    
    
    $('.minus-cart').click(function(event){
        event.preventDefault();
        molom = this.parentNode.parentNode.children[1].children[0]
        var id = $(this).attr('pid').toString()
        var eml = this
        $.ajax({
            type:"GET",
            url:"/minuscart",
            data:{
                inven_id : id
            },
            success:function(data){
                console.log(data)
                document.getElementById('total').innerText = data.total
                molom.innerText = data.quantity
            }
    
        })
    
    })
    
    $('.del-cart').click(function(){
        console.log('clicked')
        var eml = this
        var id = $(this).attr('pid').toString()
        console.log(id)
        $.ajax({
            type:"GET",
            url:"/delcart",
            data:{
                id : id
            },
            success:function(){
              eml.parentNode.parentNode.parentNode.remove()
               
            }
    
        })
    
    })





  });






