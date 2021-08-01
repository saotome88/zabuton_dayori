function map() {
  var latlng_01 = new google.maps.LatLng(35.69129219891356, 139.70593501342813);
  var latlng_02 = new google.maps.LatLng(35.7319782277483, 139.71053876658866);
  var latlng_03 = new google.maps.LatLng(35.713609437409076, 139.79316806904131);
  var latlng_04 = new google.maps.LatLng(35.70937777898786, 139.7731515574054);

  //地図のオプションを設定する
  var myOptions_01 = {
   zoom: 18,//拡大比率
   center: latlng_01,//中心座標
   mapTypeId: 'roadmap'//表示タイプ
  };

  var myOptions_02 = {
   zoom: 18,//拡大比率
   center: latlng_02,//中心座標
   mapTypeId: 'roadmap'//表示タイプ
  };

  var myOptions_03 = {
    zoom: 18,//拡大比率
    center: latlng_03,//中心座標
    mapTypeId: 'roadmap'//表示タイプ
   };

   var myOptions_04 = {
    zoom: 18,//拡大比率
    center: latlng_04,//中心座標
    mapTypeId: 'roadmap'//表示タイプ
   };

  //canvasに地図のインスタンスを作成する
  var map_01 = new google.maps.Map(document.getElementById('map_01'), myOptions_01);
  var map_02 = new google.maps.Map(document.getElementById('map_02'), myOptions_02);
  var map_03 = new google.maps.Map(document.getElementById('map_03'), myOptions_03);
  var map_04 = new google.maps.Map(document.getElementById('map_04'), myOptions_04);
};

window.addEventListener('load', map);