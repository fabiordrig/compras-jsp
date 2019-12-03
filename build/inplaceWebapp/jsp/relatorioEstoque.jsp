<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
        <title>Gerenciamento de Estoque</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="static/css/tabelas.css">
</head>
<div>
    <div>
        <ul>
            <li><a href="mercadoria">Mercadorias</a></li>
            <li><a href="estoque">Estoque</a></li>
            <li><a href="cadastrar">Cadastrar / Atualizar Produtos</a></li>
            <li><a href="relatorioestoque">Relatório</a></li>
        </ul>

    </div>
    <br/>
</div>
<div>
    <div>
        <div>
    </div>
</div>

<div>

</div>
<div>
    <form action="relatorioestoque.action" method="get">
            <div >
                    <input type="submit" value="Visualizar relatorio Estoque" class="submitButton"> 
                </div>
                <br>
                <br>
            <table>
                    <tr>
                        <th> Código</th>
                        <th> Nome</th>
                        <th> Unidade</th>
                        <th> Preço R$</th>
                        <th> Quantidade no Estoque</th>
                        <th> Descrição</th>
                    </tr>
                    
                    <%
                        String gerarRelatorio = (String) request.getAttribute("gerarRelatorio");

                        if(gerarRelatorio != null){
                            List<Produto> items = (List) request.getAttribute("ListaProdutos");

                            if(items != null){
                                for(Produto p : items){
                                    out.print("<tr>");
                                        out.print("<td>" + p.getCodigo() + "</td>");
                                        out.print("<td>" + p.getNome() + "</td>");
                                        out.print("<td>" + p.getUnidade() + "</td>");
                                        out.print("<td>" + p.getPreco() + "</td>");
                                        out.print("<td>" + p.getQuantidade() + "</td>");
                                        out.print("<td>" + p.getDescricao() + "</td>");
                                    out.print("</tr>");
                                }
                            }
                        } else{
                            String m = (String) request.getAttribute("mensagem"); 
                            if(m != null){
                                out.print(m);
                            }
                        }
                    %>
                </table>
    </form>
</div>
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
    