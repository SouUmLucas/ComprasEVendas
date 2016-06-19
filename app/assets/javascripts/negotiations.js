/**
 * Created by lucas on 18/06/16.
 */
$(document).on('page:change', function(){
    getProductAttributes();
    getNegotiationTypeAttributes();

    $("#product_id").change(function(){
        setProductAttributes();
    });

    $("#negotiationtype_id").change(function(){
        getNegotiationTypeAttributes();
    });

    $("#amount").change(function(){
        var newValue = $("#amount").val();

        if(newValue >= 0){
            atualizarPreco();
        } else {
            alert("A quantidade não pode ser negativa");
            $("#amount").val(0);
        }
    });

    $("#product_price").change(function(){
        var newValue = $("#product_price").val();

        if(newValue > 0){
            atualizarPreco();
        } else {
            alert("Para realizar a venda deve-se especificar um preço maior que 0");
            $("#product_price").val(1);
        }
    });


    function atualizarPreco(){
        $("#total_price").val(+($("#product_price").val() * $("#amount").val()).toFixed(2));
    };

    function getProductAttributes(){
        $.getJSON('/products/' + $("#product_id").val() + '.json', function(data){
            $("#product_description").val(data.description);
            $("#product_type").val(data.product_type)
        });
    };

    function setProductAttributes(){
        $.getJSON('/products/' + $("#product_id").val() + '.json', function(data){
            $("#product_description").val(data.description);
            $("#product_type").val(data.product_type)
            $("#product_price").val(data.price);

            atualizarPreco();
        });
    };

    function getNegotiationTypeAttributes(){
        $.getJSON('/negotiationtypes/' + $("#negotiationtype_id").val() + '.json', function(data){
            $("#negotiationtype_description").val(data.description);
        });
    };
});