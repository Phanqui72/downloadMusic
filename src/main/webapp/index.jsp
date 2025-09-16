<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Murach's Java Servlets and JSP</title>
  <link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>

<body>
 <p>
        <%-- Sử dụng EL để truy cập vào cookie tên userEmail và lấy giá trị của nó --%>
        User Email: ${cookie.userEmail.value}
 </p>

  <h1>List of albums</h1>

  <p>
    <a href="download?action=checkUser&amp;productCode=sontung">
      Nhạc Sơn Tùng
    </a>
    <br />

    <a href="download?action=checkUser&amp;productCode=jack">
      Nhạc Jack
    </a>
    <br />

    <a href="download?action=checkUser&amp;productCode=bolero">
      Nhạc bolero
    </a>
  </p>

</body>

</html>