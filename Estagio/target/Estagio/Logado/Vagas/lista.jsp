<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="br.ufscar.dc.dsw.domain.Vaga" %>
<%@ page import="br.ufscar.dc.dsw.domain.Empresa" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Vagas</title>
</head>
<body>
<%
    HttpSession sessao = request.getSession();
    Empresa empresaLogada = (Empresa) sessao.getAttribute("empresaLogada");
    List<Vaga> vagas = (List<Vaga>) request.getAttribute("listaVagas");
%>
<h1>Vagas da Empresa <%= empresaLogada.getNome() %></h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Descrição</th>
        <th>Remuneração</th>
        <th>Data Limite</th>
        <th>Cidade</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="vaga" items="${vagas}">
        <tr>
            <td>${vaga.id}</td>
            <td>${vaga.descricao}</td>
            <td>${vaga.remuneracao}</td>
            <td>${vaga.dataLimiteInscricao}</td>
            <td>${vaga.cidade}</td>
            <td>
                <a href="edit?id=${vaga.id}">Editar</a>
                <a href="delete?id=${vaga.id}" onclick="return confirm('Tem certeza?')">Deletar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
