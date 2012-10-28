<!-- Run this file using: xslt data.xml thisfile.xsl -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:output method="html"
	media-type="text/html" 
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="DTD/xhtml1-strict.dtd"
	cdata-section-elements="script style"
	indent="yes"
	encoding="ISO-8859-1"/>
<xsl:template match="/">
	<html>
	<head>
		<link href="style.css" rel="stylesheet" type="text/css"/>
		<title>Hello, world</title>
	</head>
	<body>
		<h1>There is no time.</1>
		<xsl:apply-templates select="Group/Item">
			<xsl:sort select="lower-case(@name)"/>
		</xsl:apply-templates>
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
