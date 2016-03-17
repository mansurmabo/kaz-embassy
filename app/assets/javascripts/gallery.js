var mosaic = $( ".mosaicflow" ).mosaicflow( {
    itemSelector: ".item",
    minItemWidth: 300
});

setTimeout(function(){
    mosaic.mosaicflow('refill');
},300);