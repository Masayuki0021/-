<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>顧客管理</h1>
    <div class="main">
    <h2>新規登録</h2>
        <!-- TODO ｢新規登録｣画面 -->
<form name="form1" action="CustomerServlet" method="post"
            onsubmit="return funcConfirm()">
            <table>

                <tr>
                    <td class="title">氏名</td>
                    <td><input type="text" name="NAME" maxlength="20"></td>
                </tr>
                <tr>
                     <td class="title">郵便番号</td>
                    <td><input type="text" name="ZIP" maxlength="20"></td>
                </tr>
                <tr>
                    <td class="title">住所1</td>
                    <td><input type="text" name="ADDRESS1" maxlength="100"></td>
                </tr>
                <tr>
                    <td class="title">住所2</td>
                    <td><input type="text" name="ADDRESS2" maxlength="100"></td>
                </tr>
                <TR>
                    <td class="title">TEL</td>
                    <td><input type="text" name="TEL" maxlength="20"></td>
                </TR>
                <TR>
                    <td class="title">FAX</td>
                    <td><input type="text" name="FAX" maxlength="20"></td>
                </TR>
                <TR>
                    <td class="title">E-mail</td>
                    <td><input type="text" name="EMAIL" maxlength="100"></td>
                </TR>
            </table>
            <p>
                <!--
                <input type="submit" value="送信">
             -->
                <button name="state" value="new_confirm">送信</button>
                <input type="button" value="戻る" onclick="history.back()">
            </p>
        </form>
    </div>
</body>
<script type="text/javascript">
    function funcConfirm() {
        if (document.form1.NAME.value == "") {
            alert("名前を入力してください");
            return false;
        }else if (!document.form1.ZIP.value.match(/^[0-9]{3}-[0-9]{4}$/)) {
            alert("郵便番号を半角数字7桁で入力してください（例：111-1111）");
            return false;
        }else if (document.form1.ADDRESS1.value == "") {
            alert("住所1を入力してください");
            return false;
        }else if (!document.form1.TEL.value.match(/[0-9]/)) {
            alert("電話番号を半角数字で入力してください");
            return false;
        }else if (!document.form1.EMAIL.value.match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]+.[A-Za-z0-9]+$/)){
            alert("E-mailを半角英数字で入力してください");
            return false;
        }else{
            return true;
        }
    }
</script>
</html>
