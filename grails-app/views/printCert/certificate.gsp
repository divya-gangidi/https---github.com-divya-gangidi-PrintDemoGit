<%--
  Created by IntelliJ IDEA.
  User: dgangigi
  Date: 11/13/2015
  Time: 1:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title> </title>
</head>

<body>
    <div id="printCert">


    <g:if test="${printAll==false}">
        <h1> Certificate of Mailing</h1>
        <div>
            <div style="font-size: larger"> ${notice.title}</div>
            <div style="font-size: large"> ${notice.address}</div>
            <div style="font-size: medium"> ${notice.noticeNum}</div>
        </div>
        <div style="height: 780px">
    </g:if>
    <g:else>
        <g:each in="${notices}">
            <h1> Certificate of Mailing</h1>
            <div>
                 <div style="font-size: larger"> ${it.title}</div>
                 <div style="font-size: large"> ${it.address}</div>
                 <div style="font-size: medium"> ${it.noticeNum}</div>
            </div>
            <div style="height: 780px">

            </div>
        </g:each>
    </g:else>
    </div>

</body>
</html>