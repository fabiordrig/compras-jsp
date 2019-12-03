<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="js/app-ajax.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="static/css/tabelas.css">
        <script type="text/javascript" src="static/js/codigoJs.js"></script>
        <script>
            var listaTabela = [];
            var listaCodigo2 = [];
            let carrinho = []
            let qtd = 0

            $(document).ready(function(){
                $("#pesquisarCodigo").click(function(){
                    if(listaTabela.indexOf($('#codigoCompra').val()) === -1){
                        listaTabela.push($('#codigoCompra').val());
                        listaCodigo2.push($('#codigoCompra').val());
                        $.ajax({
                            url : 'buscarCodigoCompra.action',
                            data : {
                                codigo : $('#codigoCompra').val(),
                                show: 1
                            },
                            success : function(result) {
                                $("#tabelaCompra").find('tbody').append(result);
                            }
                        });
                    } else{
                        alert("O Produto já foi pesquisado!");
                    }
                });

                $("#compraFinal").click(function(){
                    if(listaTabela.length > 0){
                        for(var i = 0; i < listaTabela.length; i++){
                            listaCodigo2.push($("#quantidade"+listaTabela[i]).val());
                        }
                        $.ajax({
                            url : 'relatorioCompra.action',
                            data:{
                                listaCodigo: JSON.stringify(listaCodigo2),
                            },
                            success : function(result) {
                                $("#relatorioFinal").find('tbody').append(result);
                            },
                            error: function(erro){
                                alert("Erro ao finalizar Compra!");
                            }
                        });
                    } else{
                        alert("Não Existe Produto no carrinho!");
                    }
                });

                $("#addCarrinho").click(function(){
                    if(carrinho.indexOf($('#codigoCompra').val()) === -1){
                        carrinho.push($('#codigoCompra').val());
                        listaCodigo2.push($('#codigoCompra').val());
                        $.ajax({
                            url : 'buscarCodigoCompra.action',
                            data : {
                                codigo : $('#codigoCompra').val(),
                                show: 0
                            },
                            success : function(result) {
                               // $("#tabelaCompra").find('td').remove();
                                $("#tabelaCarrinho").find('tbody').append(result);
                            }
                        });
                    } else{
                        alert("O Produto já foi adicionado ao carrinho meu consagrado!");
                    }
                });

            });
        </script>
        <title>Mercadorias</title>
    </head>
    <body>
        <div>
            <ul>
                    <li><a href="">Mercadorias</a></li>
                    <li><a href="estoque">Estoque</a></li>
                    <li><a href="cadastrar">Cadastrar / Atualizar Produtos</a></li>
                    <li><a href="relatorioestoque">Relatório</a></li>
            </ul>

        </div>
        <br/>

        <div>
            <div>
                <span id='barra'> Barra de Pesquisa </span>
                <input type='number' placeholder="Código da mercadoria" min='0' id="codigoCompra">
                <button type='button' id="pesquisarCodigo"> 
                    <label> Pesquisa </label>
                </button>
                <button type='button' id="addCarrinho"> 
                    <label> Adicionar ao carrinho </label>
                </button>
            </div>
        </div>
        <div id="cet">
            <!--<form method="get" action='relatorioCompra.action' id="formCompra">-->
                <table id='tabelaCompra'>
                    <tr>
                        <th> Código</th>
                        <th> Nome</th>
                        <th> Unidade</th>
                        <th> Preço R$</th>
                        <th> Quantidade</th>
                    </tr>
                </table>
                <!--<input id="relatorioCompra" type="submit" class="submitButton" hidden>-->
                
            <!--</form>-->
        </div>
        <br>
        <br>
        <div>
            <span>Carrinho de Compras</span>
            <table id='tabelaCarrinho'>
                <tr>
                    <th> Código</th>
                     <th> Nome</th>
                    <th> Unidade</th>
                    <th> Preço R$</th>
                </tr>
            </table>
        </div>
        <br>
        <br>
        <button  type="button" id="compraFinal"> finalizar compra </button>
        <div>
            <table id="relatorioFinal">
                <tr>
                    <th style="display:none;">A</th>
                </tr>
            </table>
        </div>
    </body>
</html>
<style>
    table {
        border-collapse: collapse;
        width: 50%;
    }

    table, th, td {
        border: 1px solid black;
        text-align: center;
    }


    th {
        height: 50px;
    }
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 100%;
    background-color: #f1f1f1;
    }

    li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
    }

    /* Change the link color on hover */
    li a:hover {
    background-color:red;
    color: white;
    }
</style>