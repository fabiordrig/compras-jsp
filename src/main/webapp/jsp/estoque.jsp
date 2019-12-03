<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Gerenciamento de Estoque</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="static/css/tabelas.css">
</head>
<body>
<div>
    <div>
            <ul>
                <li><a href="mercadoria">Mercadorias</a></li>
                <li><a href="estoque">Estoque</a></li>
                <li><a href="cadastrar">Cadastrar / Atualizar Produtos</a></li>
                <li><a href="relatorioestoque">Relatório</a></li>
            </ul>
    </div>
</div>
<div>
    <div>
        <label> Barra de Pesquisa </label>
        <form method='get' action="buscarCodigo.action">
            <input type='number' placeholder="Código da mercadoria" min='0' name="buscaCodigo">
            <input type="submit" value="Buscar Código">
        </form>
    </div>
</div>
<div>
    <table>
        <thead>
            <tr>
                <th> Código</th>
                <th> Nome</th>
                <th> Unidade</th>
                <th> Preço R$</th>
                <th> Quantidade no Estoque</th>
                <th> Descrição</th>
                <th> Atualizar</th>
                <th> Excluir</th>
            </tr>
        </thead>
        <%
            Produto produto = (Produto) request.getAttribute("Produto"); 
            Integer produtoCodigo = 0;
            if(produto != null){ 
                produtoCodigo = produto.getCodigo();
            }
        %>
        <%
            if(produto != null){
                    out.print("<tr>");
                            out.print("<td>" + produto.getCodigo() + "</td>");
                            out.print("<td>" + produto.getNome() + "</td>");
                            out.print("<td>" + produto.getUnidade() + "</td>");
                            out.print("<td>" + produto.getPreco() + "</td>");
                            out.print("<td>" + produto.getQuantidade() + "</td>");
                            out.print("<td>" + produto.getDescricao() + "</td>");
                            out.print("<td> <button  id ='atualizarP' onclick=atualizar("+produto.getCodigo()+") > Atualizar</button> </td>");
                            out.print("<td> <button id='excluir' onclick=remover("+produto.getCodigo()+") > Excluir</button></td>");
                    out.print("</tr>");
            }
        %>
    </table>
    <div>
        <%
            String mensagem = (String) request.getAttribute("mensagem"); 
            if(mensagem != null){
                out.print("<label> " + mensagem + " </label>");
            }
        %>
    </div>
</div>


<script type="text/javascript">
    function atualizar(id){
        console.log('atualizar?id='+ id)
        window.location.href = 'atualizar?id='+ id;
    }

    function remover(id){
        console.log('excluir.action?id='+ id)
        window.location.href = 'excluir.action?id='+ id;
    }
</script> 
</body>
<style>

    table {
        border-collapse: collapse;
        width: 100%;
    }

    table, th, td {
        border: 1px solid black;
        text-align: center;
    }


    th {
        color: red;
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