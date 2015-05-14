<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<title>天津师范大学 失物招领平台</title>
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
		<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
		<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
		<script>
			var curruid = 1;
			<c:if test="${sessionScope.curradmin != null }">
			curruid = ${sessionScope.curradmin.id};
			</c:if>
			<c:if test="${sessionScope.curruser != null }">
			curruid = ${sessionScope.curruser.id};
			</c:if>
			jQuery(document).ready(function ($) {
				
				 var status = "";
	             if(currUrlNoPage.indexOf("status=")>0){
	            	 status = currUrlNoPage.substring(currUrlNoPage.indexOf("status=")+7, currUrlNoPage.length);
	             }
	             if(status == 2){
	            	 $('.main h2').text("求助");
	             }

				$.ajax({
					type:"post",
					url:"./showInfoListByUser",
			        data:{
			            p:currPage,
			            size:10,
			            uid:curruid,
			            status:+status
			        },				
					dataType:"json",
					success:function(data){
						
			            var totalSize = data.total ;//总商品数
		                 var pages = data.pages ;//总页数

		                    
		                    //before  start end  after
		                    var beforeHtml = ""; //页码之前的省略号页码的html
		                    var startBtn = 1; //默认从第一页开始
		                    if(currPage-10>=1){
		                        startBtn = parseInt(currPage/10)*10+1; //十页十页地显示
		                        if(currPage%10==0){
		                            startBtn = parseInt((currPage-1)/10)*10+1;  
		                        }
		                        beforeHtml = "<div class=\"ellipsis\"> <a href=\""+currUrlNoPage+ppp+(startBtn-10)+"\">"+"<"+(startBtn-10)+"</a></div>";
		                        beforeHtml += "<div class=\"ellipsis\"> <a href=\""+currUrlNoPage+ppp+(startBtn-1)+"\">"+"<"+(startBtn-1)+"</a></div>";
		                    }
		                    var afterHtml = ""; //页码之后的省略号的html
		                    var endBtn = Math.ceil(currPage/10)*10;//从最后一页结束
		                    if(endBtn >=pages){//endBtn不能大于pages
		                        endBtn = pages;
		                    }else{
		                        if(endBtn+10 >= pages){ //如果最后一个链接 + 10 大于总页数，则  链接到下一页 即可    
		                            afterHtml = "<div class=\"ellipsis\"><a href=\""+currUrlNoPage+ppp+(endBtn+1)+"\">"+">"+(endBtn+1)+"</a></div>";
		                        }else{ //如果最后一个链接+ 10 小于等于总页数，则之后的省略号链接到endBtn+10
		                            afterHtml = "<div class=\"ellipsis\"><a href=\""+currUrlNoPage+ppp+(endBtn+1)+"\">"+">"+(endBtn+1)+"</a></div>";
		                            afterHtml += "<div class=\"ellipsis\"><a href=\""+currUrlNoPage+ppp+(endBtn+10)+"\">"+">>"+(endBtn+10)+"</a></div>";
		                        };          
		                    }


		                    
		                    
		                    var innerHtml = "";
		                    for(var i =startBtn;i<=endBtn;i++){
		                        if(i == currPage){
		                            innerHtml += "<div class=\"singlePager\"><span>"+i+"</span></div>"; 
		                        }else{
		                            innerHtml += "<div class=\"singlePager\"> <a href=\""+currUrlNoPage+ppp+i+"\">"+i+"</a></div>";
		                        };
		                    };
		                        $('.main').append("<div class=\"pager\"></div>");//
		                        
		                        $("div.pager").append(beforeHtml);
		                        $("div.pager").append(innerHtml);
		                        $("div.pager").append(afterHtml);
		                    
		                    $("div.singlePager").css({
		                        "float":"left",
		                        "width":"6%",
		                        "padding":"0 auto",
		                        "text-align":"center"
		                    });
		                    $("div.ellipsis").css({
		                        "float":"left",
		                        "width":"7%",
		                        "padding":"0 auto",
		                        "background-color":"#EED7D7",
		                        "text-align":"center"
		                    });
		                    $("div.singlePager:last").nextAll("div.ellipsis:odd").css({
		                        "margin-left":"3px"
		                    });
		                    $("div.singlePager:first").prevAll("div.ellipsis:even").css({
		                        "margin-left":"3px"
		                    });
		                    
		                    $("div.singlePager a,div.singlePager span,div.ellipsis a").css({
		                    });         
						
						
						var html = "<ul>";
                        $.each(data.result, function(k,v) {
                            html+="<li>";
                            if(v.publishAdmin != undefined){
                                html += v.publishAdmin.department.name + "";
                            }else if(v.publishUser != undefined){
                                html += v.publishUser.name + "";
                            }
                            
                            html += " 在 "+v.place;
                            if(status == 2){html +=" 丢失了 ";}
                            else if(status == -2){html +=" 发现了 ";}
                            html +='<a href="${contextPath}/info/showInfo?id='+v.id+'">'+ v.item+"</a></li>";
                        });
						html+="</ul>";
						$('.main h2').after(html);
					}
				});
			});
		</script>	
	</head>

	<body>
		<div class="container">
            <%@ include file="/include/header.jsp" %>
			<%@ include file="/include/leftnav.jsp" %>
			<div class="main">
					<h2>认领</h2>
			</div>
			<div class="footer">&copy;刘各欢 版权所有</div>
		</div>
	</body>

</html>