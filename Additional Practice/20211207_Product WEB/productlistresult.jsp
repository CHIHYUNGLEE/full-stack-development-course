<%@page import="com.my.product.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<Product> list=(List)request.getAttribute("list");%>

<style>
            body{
                overflow: scroll;
            }
            div.productlist{
                width: 100%;
                height:100%;
                /* max-width: 75%; */
            }
            div.productlist>div{
                width:24%;
                float: left;
                margin:0.5%
            }
            div.productlist>div ul{
                list-style-type: none;
                padding-left: 0px;
            }
            div.productlist>div>ul li{
                text-align: center;
            }
            div.productlist>div>ul>li>img{
                width:100%;
            }
            
        </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>        
<script>
        $(function(){
        	let $divObj = $('div.productlist>div');
        	$divObj.click(function(){
        		/* console.log(this); */
        		let prodno = $(this).attr('id');
        		let ajaxurl = './productdetail';
        		 $.ajax({
        			url: ajaxurl,
        			method : 'get',
        			data : {prodno: prodno},
        			success:function(responseData){
        				let $articlesObj = $('section>div.articles');
        				$articlesObj.empty();
        				$articlesObj.html(responseData);
        			}
        		}); 
        		//$('section>div.articles').load('./productdetail?prodNo='+prodNo);
        		return false;
        	});
        });
	</script>
	
	
<div class="productlist">
	<%for(Product p:list){
		String prodno = p.getProdNo();
		String prodname = p.getProdName();
		int prodprice = p.getProdprice();	
	%>
		 <div id="<%=prodno%>">
		 <ul>
             <li><img src="./images/<%=prodno%>.jpg" alt="<%=prodname%>"></li>
             <li id = "prodno"><%=prodno %>
             <li><%=prodname %></li>
             <li><span><%=prodprice%></span></li>
         </ul>
     </div>
   <%} %>
</div>
