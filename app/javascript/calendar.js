function calendar() {
  const event = document.getElementById("event");
  event.addEventListener("click", function(){
    console.log("クリック！")
  });
};

window.addEventListener('load', calendar);