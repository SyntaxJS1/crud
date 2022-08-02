document.querySelector(".first").addEventListener("click", function(e){
    targetElement = e.target;
    //console.log(targetElement);
    if(targetElement.classList.contains("activities")){
        document.querySelector(".u").classList.toggle("active");
        document.querySelector(".b").classList.toggle("active");
    }else if(targetElement.classList.contains("setting")){
        document.querySelector(".p").classList.toggle("active");
        document.querySelector(".ss").classList.toggle("active");
    }
    else if(targetElement.classList.contains("u")){
        //console.log(targetElement);
        window.location.href = "http://localhost/crud/users.php"
    }
});

document.querySelector("button").addEventListener("click", function(){
    window.location.href = "http://localhost/crud/add.php"
});