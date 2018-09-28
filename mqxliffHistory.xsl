<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2" xmlns:mq="MQXliff" xml:space="preserve">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>History for <xsl:value-of select="//xliff:file/@original" /></title>
				<style>
					table {
						width: 100%;
					}
					td {
						word-wrap: break-word;
						overflow: hidden;
					}
					table, th, td {
						border: 1px solid black;
					}
					caption {
						font-weight: bold;
					}
				</style>
			</head>
			<body>
				<table>
					<caption>Versions</caption>
					<tbody>
						<tr>
							<th>Version</th>
							<th>Event</th>
							<th>User</th>
						</tr>
						<xsl:apply-templates select="//mq:versioninfos" />						
					</tbody>
				</table>
				<br/>
				<table>
					<caption>Segments</caption>
					<tbody>
						<xsl:apply-templates select="//xliff:body" />						
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="//mq:versioninfos">
	    <xsl:for-each select="mq:minorversioninfo">
			 <tr>
					<td><xsl:value-of select="./@mq:minorversion" /></td>
					<td><xsl:value-of select="./@mq:createreason" /></td>
					<td><xsl:value-of select="./@mq:creatoruser" /></td>
			 </tr>
	    </xsl:for-each>
	</xsl:template>
	
	<xsl:template match="//xliff:body">
		<xsl:for-each select="xliff:trans-unit">
			<tr>
				<th>Segment#</th>
				<th>Version</th>
				<th>Source</th>
				<th>Target</th>
				<th>Status</th>
				<th>User</th>
				<th>Date</th>
			</tr>
			 <tr>
					<td><xsl:value-of select="./@id" /></td>
					<td><xsl:text>Current</xsl:text></td>
					<td><xsl:value-of select="./xliff:source/text()" /></td>
					<td><xsl:value-of select="./xliff:target/text()" /></td>
					<td><xsl:value-of select="./@mq:status" /></td>
					<td><xsl:value-of select="./@mq:lastchanginguser" /></td>
					<td><xsl:value-of select="./@mq:lastchangedtimestamp" /></td>
			</tr>
			<xsl:apply-templates select="mq:minorversions" />
		</xsl:for-each>
	</xsl:template>
		
	<xsl:template match="mq:minorversions">
		<xsl:for-each select="mq:historical-unit">
			 <tr>
					<td></td>
					<td><xsl:value-of select="./@mq:minorversionstart" /><xsl:text> - </xsl:text><xsl:value-of select="./@mq:minorversionend" /></td>
					<td><xsl:value-of select="./xliff:source/text()" /></td>
					<td><xsl:value-of select="./xliff:target/text()" /></td>
					<td><xsl:value-of select="./@mq:status" /></td>
					<td><xsl:value-of select="./@mq:lastchanginguser" /></td>
					<td><xsl:value-of select="./@mq:lastchangedtimestamp" /></td>
			 </tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
