<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="KNU Admin"/>
    </c:import>
    
    <body class="sb-nav-fixed">
    <form action="" id="register" name="register" method="post">
        <%@include file="./navigation.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
            	<%@include file="./gnb.jsp" %>
            </div>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4"></h1>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Metaverse as a Solution</li>
                        </ol> -->
                    </div>
                    <div>	
	                    <p style="margin-left:12px; font-size : 20px; font-weight:700">문의하기</p>
	                    <table class="kiosk-table" style="max-width:80%; margin-left:33px; margin-bottom:2px">
				            <tbody class="kiosk-table-tbody">
					            <tr class="kiosk-table-tr">
						            <th class="kiosk-th-co1">이름</th>
						            <td>
						            	<input type="text" class="kiosk-input" id="mail_name" name="mail_name" style="width:80%"/>
					            	</td>
				            	</tr>
				            	<tr class="kiosk-table-tr">
					            	<th class="kiosk-th-co1">연락처 / 메일</th>
						            <td>
						            	<input type="text" class="kiosk-input" id="mail_reply" name="mail_reply" style="width:80%"/>
					            	</td>
				            	</tr>
				            	<tr class="kiosk-table-tr">
					            	<th class="kiosk-th-co1">문의내용</th>
						            <td>
						            	<textarea id="mail_content" name="mail_content" cols="130" rows="7" style="width:100%"></textarea>
						            
					            	</td>
					            </tr>
				            </tbody>
			            </table>
	                    <button type="button" id="button1" onclick="button_mail();" style="width:10%; float: right">문의</button>
                    </div>
                </main>
                
                <%@include file="./footer.jsp" %>
                
            </div>
        </div>
        <script>
	        /* function testtest () {
	        	var txt = $('#test').val();
	        	 var exp = /^http[s]?\:\/\//i;
	        	 console.log(exp.test(txt));
	        	$("#register").attr("action", "/test.do");
	        	$("#register").submit();
	        } */
	        function button_mail(){
				if(confirm ("문의하시겠습니까?")){
					$("#register").attr("action", "/mail_trans.do");
					$("#register").submit();
				}
	        }
	        function button1_click(){
				if(confirm ("등록하시겠습니까?")){
					$("#register").attr("action", "/space_add.do");
					$("#register").submit();
				}
	        }
	        $('#attach_file').change(function() {
				if(this.files && this.files[0]){
					if(this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image'){
						alert ('이미지 파일만 첨부할 수 있습니다.');
						$('#attach_file').val("")
						return false
					}
					var reader = new FileReader;
					reader.onload = function(data){
						$(".select_img img").attr("src", data.target.result).width(200);
					}
					reader.readAsDataURL(this.files[0]);
				}
				else{
					$(".select_img img").attr("src", "");
				}
			});
        </script>
        
        <script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../../../../js/scripts.js"></script>
        <script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
        <script src="../../../../../js/all.min.js" crossorigin="anonymous"></script>
        <link href="../../../../../css/egovframework/pict/styles.css" rel="stylesheet" />
        </form>
    </body>
</html>
