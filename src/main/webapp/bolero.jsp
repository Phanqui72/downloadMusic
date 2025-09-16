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
                <td>Về đâu mái tóc người thương</td>
                <td>
                    <a href="/musicStore/sound/${productCode}/star.mp3">MP3</a>
                </td>
            </tr>
            <tr>
                <td>Sầu tím thiệp hồng</td>
                <td>
                    <a href="/musicStore/sound/${productCode}/no_difference.mp3">MP3</a>
                </td>
            </tr>
            <tr>
                <td>Con đường xưa em đi</td>
                <td>
                     <a href="/musicStore/sound/${productCode}/star.mp3">MP3</a>
                </td>
            </tr>
            <tr>
                <td>Túp liều lý tưởng</td>
                <td>
                      <a href="/musicStore/sound/${productCode}/no_difference.mp3">MP3</a>
                </td>
            </tr>
        </td>
    </table>

</body>

</html>