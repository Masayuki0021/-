<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="customer.CustomerBean" id="customer" scope="session" />
<!doctype html>
<html>
<head>
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>顧客管理</h1>
    <div class="main">


     <h2>削除の確認</h2>
        <table>
         <!-- edit from here KI　｢削除確認｣画面 -->
                <tr>
                    <td class="title">氏名</td>
                    <td><%=customer.getName() %></td>
                </tr>
                <tr>
                     <td class="title">郵便番号</td>
                    <td><%=customer.getZip() %></td>
                </tr>
                <tr>
                    <td class="title">住所1</td>
                    <td><%=customer.getAddress1() %></td>
                </tr>
                <tr>
                    <td class="title">住所2</td>
                <td> <%if (customer.getAddress2() == null) {%><%=""%><%}else{%><%=customer.getAddress2()%><%}%>
                </tr>
                <TR>
                    <td class="title">TEL</td>
                    <td><%=customer.getTel() %></td>
                </TR>
                <TR>
                    <td class="title">FAX</td>
                <td> <%if (customer.getFax() == null) {%><%=""%><%}else{%><%=customer.getFax()%><%}%>
                </TR>
                <TR>
                    <td class="title">E-mail</td>
                    <td><%=customer.getEmail() %></td>
                </TR>
            </table>
            <form name="form" action="CustomerServlet" method="post">
            <p>
                <button name="state" value="delete">OK</button>
                <input type="button" value="戻る" onclick="history.back()">
            </p>
            </form>

        <!--end edit ｢削除確認｣画面 -->

    </div>
</body>