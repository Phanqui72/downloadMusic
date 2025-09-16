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
    <h1>Downloads</h1>
    <h2>Nhạc anh J97 Bến Tre</h2>

    <table>
        <th>
            <tr>
                <th>Song title</th>
                <th>Audio Format</th>
            </tr>
        </th>
        <td>
            <tr>
                <td>Hồng Nhan</td>
                <td>
                    <a href="${pageContext.request.contextPath}/sound/jack/hongnhan.mp3">MP3</a>
                </td>
            </tr>
            <tr>
                <td>Bạc phận</td>
                <td>
                     <a href="${pageContext.request.contextPath}/sound/jack/bacphan.mp3">MP3</a>
                </td>
            </tr>
            <tr>
                <td>Sóng gió</td>
                <td>
                    <a href="${pageContext.request.contextPath}/sound/jack/songio.mp3">MP3</a>
                </td>
            </tr>

        </td>
    </table>

</body>

</html>