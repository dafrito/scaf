#!/bin/bash
PATH=/bin:/usr/bin

echo "Status: 200"
echo "Content-type: text/html"
echo

cat <<EOF
<html>
<head>
<title>
	@SITE@
</title>
</head>
<body>
	<center><h1>Welcome to @@SITE@@</h1></center>
	<p>This page was generated at `date`.</p>
	<p>`uname -a`</p>
</body>
</html>
EOF
