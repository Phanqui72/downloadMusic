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
    <h2>Nhạc Bolero</h2>

    <table>
        <th>
            <tr>
                <th>Song title</th>
                <th>Audio Format</th>
            </tr>
        </th>
        <td>
            <tr>
                <td>Phép màu</td>
                <td>
                    <a href="${pageContext.request.contextPath}/sound/bolero/phepmau.mp3">MP3</a>
                </td>
            </tr>

            <tr>
                <td>Nhạc phim mưa đỏ</td>
                <td>
                      <a href="${pageContext.request.contextPath}/sound/bolero/congidephon.mp3">MP3</a>
                </td>
            </tr>
        </td>
    </table>

</body>

</html>