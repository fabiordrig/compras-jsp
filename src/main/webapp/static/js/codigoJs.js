window.onload = jsListen;

function jsListen(){
    var tabelaCompra = document.getElementById("tabelaCompra");

    tabelaCompra.addEventListener("mouseover", changeToRed, false);
    tabelaCompra.addEventListener("mouseout", changeToGrayBarra, false);
}

function changeToRed() {
    tabelaCompra.setAttribute("style", "color:green;");
}

function changeToGrayBarra() {
    tabelaCompra.setAttribute("style", "color:gray;");
}
