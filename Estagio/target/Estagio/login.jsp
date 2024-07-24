<%@ page import="br.ufscar.dc.dsw.util.Erro" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="${sessionScope.locale.language}">
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="message" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="page.title.login" /></title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            font-family: 'Arial', sans-serif;
            margin: 0;
        }
        .login-container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .login-container h1 {
            margin-bottom: 24px;
            color: #333;
        }
        .login-container input[type="email"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .login-container button {
            background: #fda085;
            border: none;
            color: white;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin: 10px 0;
            font-size: 16px;
        }
        .login-container button:hover {
            background: #f6d365;
        }
        .login-container a {
            color: #fda085;
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
        .login-container .error-messages {
            color: red;
            margin-bottom: 10px;
        }
        .list-jobs-button {
            color: #fda085;
            text-decoration: none;
            display: block;
            margin-top: 30;
        }
        .list-jobs-button:hover {
            text-decoration: underline;
        }
        .language-switcher {
            margin-top: 20px;
        }
        .language-switcher a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }
        .language-switcher img {
            width: 24px;
            height: 24px;
            vertical-align: middle;
        }
        .language-switcher a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1><fmt:message key="label.login" /></h1>
    <form action="login" method="post">
        <input type="email" name="login" placeholder="<fmt:message key='label.email' />" required>
        <input type="password" name="senha" placeholder="<fmt:message key='label.password' />" required>
        <button type="submit"><fmt:message key="label.enter" /></button>
    </form>
    <a href="register.jsp"><fmt:message key="label.registerPrompt" /></a>
    <div class="error-messages">
        <%
            String mensagemErro = (String) session.getAttribute("mensagemErro");
            if (mensagemErro != null) {
                out.println("<p>" + mensagemErro + "</p>");
                session.removeAttribute("mensagemErro");
            }
        %>
    </div>
    <a href="listarVagas" class="list-jobs-button"><fmt:message key="label.viewAllJobs" /></a> 
    <div class="language-switcher">
        <a href="?lang=pt_BR"><img src="${pageContext.request.contextPath}src/main/resources/images/flag-br.png" alt="Português"></a>
        <a href="?lang=en"><img src="${pageContext.request.contextPath}/resources/images/flag-us.png" alt="English"></a>
    </div>
</div>
</body>
</html>
