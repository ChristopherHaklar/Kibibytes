<!DOCTYPE html>
<html>
  <head><title>curr id</title></head>
<body>
<?php

  $dbhandle = mysqli_connect("cit496p-rds-instance.cq7kijnqmhux.us-west-1.rds.amazonaws.com", "pma", "f00barhex", "cloudproject");
	# args: server, user, pass, database_name
	# NOTE: for your AWS project as you lift-and-shift, you will be replacing
	# localhost with the URL of your database server (probably an S3 instance on AWS)
	# -- you can obtain this URL from AWS itself
	# Remember: on AWS, the web server(s) and db server are separate machines

  if(!$dbhandle)
  { 
    echo("Nooooo...where is the database?!!!</body></html>");
    die();
  }

  # $newId = 108;  ## basic test of the newId var
 
  $insertSql = "INSERT INTO idtable VALUES (null)";
  $selectSql = "SELECT MAX(id) FROM idtable";

  mysqli_query($dbhandle, $insertSql);  # insert a new ID (auto-incrementing)
  $result = mysqli_query($dbhandle, $selectSql);  # grab the latest (max) ID
  while($row = mysqli_fetch_row($result))
  {
    $newId = $row[0];
  }

?>
	<h1> <?php echo $newId; ?> </h1>
</body>
</html>
