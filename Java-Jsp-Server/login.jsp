<html>
<head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script type="text/javascript">
      function calling(value){
        $.ajax({
           'url' : 'https://api.fda.gov/drug/label.json?search='+value,
            'type' : 'GET',
            'dataType' : 'json',// 
            'contentType' : 'application/json',
            'complete' : function(response) {
                console.log(response);
	        $('#result').html(response.response);
             }
        });
       }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
  <% String val = request.getParameter("disease");%>
  <input type="button" value="Call Servlet" name="Call Servlet"  onclick="calling('<%=val%>');"/>
  <pre id= "result"></pre>
</body>
</html>

