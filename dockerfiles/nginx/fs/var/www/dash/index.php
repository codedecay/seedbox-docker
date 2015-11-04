<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="robots" content="noindex">
	<title>Dashboard - The Box</title>
    <link rel="icon" type="img" href="favicon.png">
	<link rel="stylesheet" type="text/css" href="../static/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>

<body>
<div class="header">
	<?php
	if (empty($_SERVER['PHP_AUTH_USER'])) {
	?>
		<a href="login/" class="right">Login</a>		
	<?php
	} else {
	?>
		<span class="right">Welcome <?php echo $_SERVER['PHP_AUTH_USER']?></span>
	<?php
	}
	?>
</div>
<div id="logotop"></div>
<section class="wrapper">
  <section class="page">
    <header>
      Dashboard
      <nav class="backlink">
        <a href=""><span class="entypo-left-thin"></span></a>
      </nav>
    </header>
	<section class="content">
	<?php if (!empty($_SERVER['PHP_AUTH_USER'])) {
	?>
		  <a class="item" href="torrent/">
			<span class="fa fa-download"></span><br />
			<h2>Torrent</h2>
		  </a>
		  <a class="item" href="sickrage/">
			<span class="fa fa-television "></span><br />
			<h2>Sickrage</h2>
		  </a>
		  <a class="item" href="couchpotato/">
			<span class="fa fa-film"></span><br />
			<h2>Couchpotato</h2>
		  </a>
		  <a class="item" href="files/">
			<span class="fa fa-file"></span><br />
			<h2>Files</h2>
		  </a>
		  <a class="item" href="emby/">
			<span class="fa fa-play-circle"></span><br />
			<h2>Emby</h2>
		  </a>
 	<?php
        }
        ?>

  	<a class="item" href="up1/">
		<span class="fa fa-upload"></span><br />
		<h2>Upload</h2>
	  </a>
      <a class="item" href="git/">
      <span class="fa fa-file-code-o"></span><br />
        <h2>Git</h2>
      </a>
      <a class="item" href="up1/">
        <span class="fa fa-file-text"></span><br />
        <h2>Paste</h2>
      </a>
	  <a class="item" href="proxy/">
        <span class="fa fa-lock"></span><br />
        <h2>Proxy</h2>
      </a>
    </section>
  </section>
</section>
</body>
</html>
