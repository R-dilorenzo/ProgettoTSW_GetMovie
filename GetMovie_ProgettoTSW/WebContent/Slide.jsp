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
<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Montserrat:300');

body {
   background-color: #f2f2f2;
}

h1 {
   font-family: 'Montserrat';
}

.carousel-nav-icon {
   height: 48px;
   width: 48px;
}
.carousel-item {
   .col, .col-sm, .col-md {
      margin: 8px;
      height: 300px;
      background-size: cover;
      background-position: center center;
   }
   img {
      
   }
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
<div class="container text-center my-3">
    <h2>Ultimi film aggiunti:</h2>

 <div class="my-5 text-center">
   <div class="row d-flex align-items-center">
      <div class="col-1 d-flex align-items-center justify-content-center">
         <a href="#carouselExampleIndicators" role="button" data-slide="prev">
            <div class="carousel-nav-icon">
               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 129 129" xmlns:xlink="http://www.w3.org/1999/xlink">
                  <path d="m88.6,121.3c0.8,0.8 1.8,1.2 2.9,1.2s2.1-0.4 2.9-1.2c1.6-1.6 1.6-4.2 0-5.8l-51-51 51-51c1.6-1.6 1.6-4.2 0-5.8s-4.2-1.6-5.8,0l-54,53.9c-1.6,1.6-1.6,4.2 0,5.8l54,53.9z"/>
               </svg>
            </div>
         </a>
      </div>
      <div class="col-10">
         <!--Start carousel-->
         <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="row">
                     <a href="InfoFilm?nome=<%=link.get(z) %>"> <img style="height:20rem" src="<%=film.get(z)%>"></a>
                	<%for(i=j+1;i<=2;i++){ %>
       <a href="InfoFilm?nome=<%=link.get(i) %>">   <img  style="height:20rem" src="<%=film.get(i)%>"></a>
      
      <%
j++;
     
    }
    %>  
                  </div>
               </div>
                 <%
    
    while((((size/3)-1)-nsize)>=1){ 
    	  z=j;
    	  nsize++;
    %>
     
               <div class="carousel-item">
               <%for(i=z+1;i<=z+3;i++){%>
                  
                   <a href="InfoFilm?nome=<%=link.get(i) %>">
                     <img style="height:20rem" src="<%=film.get(i)%>"></a>
                            <%
    j++; 
      
    } %>
    
  <%
    }
    //else{  %>      
                     
                  </div>
    
               </div>
            </div>
         </div>
         <!--End carousel-->
      </div>
      <div class="col-1 d-flex align-items-center justify-content-center"><a  href="#carouselExampleIndicators" data-slide="next">
         <div class="carousel-nav-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 129 129" xmlns:xlink="http://www.w3.org/1999/xlink">
               <path d="m40.4,121.3c-0.8,0.8-1.8,1.2-2.9,1.2s-2.1-0.4-2.9-1.2c-1.6-1.6-1.6-4.2 0-5.8l51-51-51-51c-1.6-1.6-1.6-4.2 0-5.8 1.6-1.6 4.2-1.6 5.8,0l53.9,53.9c1.6,1.6 1.6,4.2 0,5.8l-53.9,53.9z"/>
            </svg>
         </div>
         </a>
      </div>
   </div>
</div>

       </div>
 
             
	</div>
         
</div>
  


</body>
</html>