function map() {
  var MyLatLng = new google.maps.LatLng(35.69129219891356, 139.70593501342813);
  var Options = {
  zoom: 17,      //地図の縮尺値
  center: MyLatLng,    //地図の中心座標
  mapTypeId: 'roadmap'   //地図の種類
  };
  var map = new google.maps.Map(document.getElementById('map'), Options);

  var marker = new google.maps.Marker({
    position: MyLatLng,
    map: map
});
};

window.addEventListener('load', map);