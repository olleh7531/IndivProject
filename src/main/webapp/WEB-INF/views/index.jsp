<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<!-- fa fa-folder -->

<head>
    <meta charset="UTF-8">
    <title>Disabling right click menu using javascript</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
    <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/jquery-1.12.4.js'/>"></script>
    <script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'/>">
    <style>
        .imgSelect {
            cursor: pointer;
        }

        .popupLayer {
            /*            position: absolute;*/
            display: none;
            background-color: #ffffff;
            border: solid 2px #d0d0d0;
            width: 100%;
            height: 30%;
            padding: 10px;

        }

        .popupLayer div {
            /*            position: absolute;*/

            top: 5px;
            right: 5px
        }

        /****/
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            position: relative;
        }


        /* 마우스 메뉴 */

        .context-menus {
            position: absolute;
            display: none;
            border: 1px solid black;
            width: 100px;
            text-align: center;
            margin: 0px;
            padding: 0px;
        }

        .context-menus.active {
            display: block;
            background-color: white;
        }

        .context-menus.active>ul>li {
            list-style: none;
            padding: 10px;
        }

        .context-menus.active>ul>li:hover {
            background-color: lightgreen;
        }

        #draggable {
            width: 70px;
            height: 70px;
            padding: 0.5em;
        }

        .borbot {
            border-bottom: 1px solid;
            text-align: left;
        }
    </style>
</head>

<body>


    <div id="draggable" >
        <a href="javascript:text('1')" style="color: #333333;">
            <i class="fa fa-folder-open fa-3x"></i>
            <p>Drag me around</p>
        </a>
    </div>


    <div id="myModal" class="modal fade">
        <div class="modal-dialog" id="modal_01" style="max-width: 100%; width: auto; display: table;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Settings</h4>

                </div>
                <div class="modal-body">
                    <table>
                        <tr>
                            <td>asdegfgewgssssssssssssssssssssssssssssssssssss</td>
                        </tr>
                        <tr>
                            <td>asdegfgewg</td>
                        </tr>
                        <tr>
                            <td>asdegfgewg</td>
                        </tr>
                        <tr>
                            <td>asdegfgewg</td>
                        </tr>
                        <tr>
                            <td>asdegfgewg</td>
                        </tr>
                        <tr>
                            <td>asdegfgewg</td>
                        </tr>
                    </table>
                    
                    <style>
.left-box {
  background: red;
  float: left;
  width: 50%;
}
.right-box {
  background: blue;
  float: right;
  width: 50%;
}
</style>
<div class='left-box'>왼쪽</div>
<div class='right-box'>오른쪽</div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="popupLayer">
        <div class="borbot">
            <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
        </div>
        <table>
            <tr>
                <td>asdegfgewg</td>
            </tr>
            <tr>
                <td>asdegfgewg</td>
            </tr>
            <tr>
                <td>asdegfgewg</td>
            </tr>
            <tr>
                <td>asdegfgewg</td>
            </tr>
            <tr>
                <td>asdegfgewg</td>
            </tr>
            <tr>
                <td>asdegfgewg</td>
            </tr>
        </table>
    </div>

    <!-- 마우스 오른쪽 메뉴 -->
    <div id="context-menus" class="context-menus">
        <ul> 
            <li><a href="javascript:text('1')">1번 메뉴</a></li>
            <li class="imgSelect">2번 메뉴</li>
            <li><a href="javascript:text('2')">3번 메뉴</a></li>
            <li>4번 메뉴</li>
            <li><a href="#myModal" data-backdrop="false" data-toggle="modal">배경 변경</a></li>
        </ul>
    </div>
</body>
<script>
	var draggable = $("#draggable")
	draggable.offset({top: 300, left: 200});
	
	setInterval(function(){
		var draggable = $("#draggable")
		var draggableX = draggable.offset().left;
		var draggableY = draggable.offset().top;
		console.log(draggableX,draggableY);
	},3000);
    function text(e) {
       alert(e);
        //$("#myModal").show();
    }


    $(function() {
        $("#draggable").draggable();
        $("#modal_01").draggable();
        $(".popupLayer").draggable();
    });

    $(function() {

        /* 마우스 오른쪽 메뉴 변수 */
        var test = document.getElementById("context-menus");

        /* 마우스 클릭 리스너를 초기 실행시킨다. */
        function init() {
            rightMouseListener();
            leftMouseListener();
        }

        /* 마우스 왼클릭 감지 */
        function leftMouseListener() {
            document.addEventListener("click", function(e) {
                toggleOnOff(0);
            })
        }

        /* 마우스 우클릭 감지 */
        function rightMouseListener() {
            document.addEventListener("contextmenu", function(e) {
                event.preventDefault();
                toggleOnOff(1);
                showMenu(e.x, e.y);
            });
        }

        /* 마우스 메뉴 on & off */
        function toggleOnOff(num) {
            num === 1 ? test.classList.add("active") : test.classList.remove("active");
        }

        /* 마우스 클릭한 지점에서 메뉴 보여줌 */
        function showMenu(x, y) {
            console.log(test);
            test.style.top = y + "px";
            test.style.left = x + "px";
        }

        init();
    });


    function closeLayer(obj) {
        $(obj).parent().parent().hide();
        $('.popupLayer').css({
            "top": 0,
            "left": 0,
            "position": "relative"
        })
    }

    $(function() {

        /* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
        $('.imgSelect').click(function(e) {
            var sWidth = window.innerWidth;
            var sHeight = window.innerHeight;

            var oWidth = $('.popupLayer').width();
            var oHeight = $('.popupLayer').height();

            // 레이어가 나타날 위치를 셋팅한다.
            var divLeft = e.clientX + 10;
            var divTop = e.clientY + 5;

            // 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
            if (divLeft + oWidth > sWidth) divLeft -= oWidth;
            if (divTop + oHeight > sHeight) divTop -= oHeight;

            // 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
            if (divLeft < 0) divLeft = 0;
            if (divTop < 0) divTop = 0;

            $('.popupLayer').css({
                "top": divTop,
                "left": divLeft,
                "position": "absolute"
            }).show();
        });

    });
</script></html>
