
  $(function() {
    $( "#search" ).autocomplete({
     source: function (request, response) {
            $.ajax({
                url: "SearchController",
                dataType: 'json',
                data: request,
                success: function (data) {
                 if (typeof Array.prototype.forEach != 'function') {
         Array.prototype.forEach = function(callback){
           for (var i = 0; i < this.length; i++){
             callback.apply(this, [this[i], i, this]);
           }
         };
     }

     var values = data;
     var newArray = new Array(values.length);
     var i = 0;
      values.forEach(function (entry) {
                     var newObject = {
                         label: entry.name
                     };
                     newArray[i] = newObject;
                     i++;
                 });

       response(newArray);
                }   
            }); 
        },  
        minLength: 1
    });
  });
