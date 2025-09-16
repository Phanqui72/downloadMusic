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
    <h2>Nhạc anh Sơn Tùng Thái Bình</h2>

    <table>
        <th>
            <tr>
                <th>Song title</th>
                <th>Audio Format</th>
            </tr>
        </th>
        <td>
            <tr>
                <td>Nơi này có anh</td>
                <td>
                    <a href="${pageContext.request.contextPath}/sound/sontung/noinaycoanh.mp3">MP3</a>
                </td>
            </tr>
            <tr>
                <td>Em của ngày hôm qua</td>
                <td>
                    <a href="${pageContext.request.contextPath}/sound/sontung/emcuangayhomqua.mp3">MP3</a>
                </td>
            </tr>
        </td>
    </table>

</body>

</html>