<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@page import="model.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<style>

.col-md-3{
  display: inline-block;
  margin-left:60px;
}
.col-md-3 img{
  width:100%;
  height:270px;
  
}
body .carousel-indicators li{
  background-color:#284b6e;
}
body .carousel-indicators{
  bottom: 0;
}
body .carousel-control-prev-icon,
body .carousel-control-next-icon{
  background-color:#284b6e;
  color:#284b6e;
}
body .no-padding{
  padding-left: 0;
  padding-right: 0;
   }
</style>
</head>
<body>
	<%
				

				ArrayList<Film> pren = (ArrayList<Film>) request.getAttribute("AllFilm");
			%>
			
			
			<div class="jumbotron jumbotron-fluid" id="jumbo" >
		
		<div id="demo" class="carousel slide" data-ride="carousel" >
			
			<%
			
			ArrayList<String> film =new ArrayList<String>();
			for (Film f:pren){
				film.add(f.getImg());
			}
			
			ArrayList<String> link =new ArrayList<String>();
			for (Film f:pren){
				link.add(f.getNome());
			}
			
			int size=film.size();
			int i,j=0;
		int z=0;
		int nsize=0;
				%>
	 <!-- The slideshow -->
	<div class="text-center mb-3"><b>Ultimi film aggiunti:</b></div>
  <div class="container carousel-inner no-padding">
    <div class="carousel-item active">
     <div class="col-xs-3 col-sm-3 col-md-3">
      <a href="InfoFilm?nome=<%=link.get(z) %>">  <img src="<%=film.get(z)%>"></a>
      </div>   
    <%for(i=j+1;i<=2;i++){ %>
      <div class="col-xs-3 col-sm-3 col-md-3">
       <a href="InfoFilm?nome=<%=link.get(i) %>">   <img src="<%=film.get(i)%>"></a>
      </div>    
      <%
j++;
     
    }
    %>  
    </div>
    <%
    
    while((((size/3)-1)-nsize)>=1){ 
    	  z=j;
    	  nsize++;
    %>
    <div class="carousel-item">
    <%for(i=z+1;i<=z+3;i++){%>
      <div class="col-xs-3 col-sm-3 col-md-3">
        <a href="InfoFilm?nome=<%=link.get(i) %>">  <img src="<%=film.get(i)%>"></a>
      </div>    
      <%
    j++; 
      
    } %>
    </div>
  <%
    }
    //else{  %>
  
  <%//}   %>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
	</div>
	
        
	</div>
			
			
		
</body>
</html>