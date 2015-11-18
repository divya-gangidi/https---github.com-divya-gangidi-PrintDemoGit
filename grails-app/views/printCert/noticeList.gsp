<%--
  Created by IntelliJ IDEA.
  User: dgangigi
  Date: 11/13/2015
  Time: 1:01 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>

    <title> Print Notice Network</title>
    <meta name="layout" content="main">

    <script type="text/javascript">

        function printCert(noticeNum){
            $("#certificate").html();
            $.ajax({
                        url: "/printCert/printCertificate?id="+noticeNum,
                        cache: false
                    })
                    .done(function( html ) {
                        $( "#certificate" ).html( html );
                    });
            //showPrintDialog();

        }

        function printAllCerts(){

            $("#certificate").html();
            $.ajax({
                        url: "/printCert/printAllCertificates",
                        cache: false
                    })
                    .done(function( html ) {
                        $( "#certificate" ).html( html );
                    });

            showPrintDialog();
        }

        function showPrintDialog(){

            $("#certificate").dialog({
                modal: true,
                autoOpen: true,
                resizable: false,
                height:"auto",
                width:612,
                buttons: {
                    "Close": function() {
                        $(this).dialog("close");
                    }
                }
            });
            $( "#certificate" ).printThis();
        }
    </script>
</head>

<body>


<div id="print">

    <table style="border: 1px solid">

        <tr>
        <th>Notice Number</th>
        <th>Case Title</th>
        <th>Address</th>
        <th>Download Certificate</th>
        </tr>
        <g:each in="${notices}">
            <tr>
                <td>${it.noticeNum}</td>
                <td>${it.title}</td>
                <td>${it.address}</td>
                <td><a href="#" onclick="printCert(${it.noticeNum})">Download</a></td>
            </tr>
        </g:each>
    </table>

    <div style="padding-left: 20px">
        <g:submitButton name="PrintAll" value="Print All" onclick="printAllCerts()"/>
    </div>

</div>

<div id="certificate" hidden >
Certificate of publication
</div>

<div class="container">


        <div class="row">


        <div class="col-xs-6">Column1</div>
        <div class="col-xs-6">Column2</div>


    </div>
    </div>
</body>
</html>