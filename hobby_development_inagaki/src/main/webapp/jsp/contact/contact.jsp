<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
<link rel="stylesheet" href="../css/ress.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
<div id="home" class="mv-top">

        <div class="wrapper">

            <h1>お問い合わせ</h1>
            <form method="post" action="#">
                <label for="name">名前</label>
                <input type="text" id="name" name="name"><br>

                <label for="read">ふりがな</label>
                <input type="text" id="read" name="read"><br>
                
              	<div class="gender">
              		<label for="gender">性別</label><br>
                	<input type="radio" name="gender" value="男">男
                	<input type="radio" name="gender" value="女">女
                	<input type="radio" name="gender" value="その他">その他
				</div>
				
				<div class="hobby">
					<label for="hobby">趣味</label><br>
					<input type="checkbox" name="hobby" value="温泉めぐり">温泉めぐり
					<input type="checkbox" name="hobby" value="ひとり旅">ひとり旅
					<input type="checkbox" name="hobby" value="グランピング">グランピング<br>
					<input type="checkbox" name="hobby" value="御朱印集め">御朱印集め
					<input type="checkbox" name="hobby" value="野外フェス">野外フェス
					<input type="checkbox" name="hobby" value="ゴルフ">ゴルフ<br>
					<input type="checkbox" name="hobby" value="お取り寄せ">お取り寄せ
					<input type="checkbox" name="hobby" value="お酒">お酒
					<input type="checkbox" name="hobby" value="サウナ">サウナ<br>
					<input type="checkbox" name="hobby" value="レゴブロック">レゴブロック
					<input type="checkbox" name="hobby" value="麻雀">麻雀
					<input type="checkbox" name="hobby" value="競技かるた">競技かるた
				</div>
				
				<label for=" message">一言</label>
                <input type="text" id="message" name="message"><br>

                <input type="submit" value="確認画面">
            </form>
            
        </div><!-- /wrapper -->

</div><!-- home -->
</body>
</html>