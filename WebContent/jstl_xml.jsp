<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<title> Utilisation d'un fichier xml dans une JSP</title>
	</head>
	<body>
		<c:import url="monDocument.xml" varReader="monReader">
			<x:parse var="doc" doc="${monReader}" scope="session"></x:parse>
			<x:out select="count($doc/news/article/auteur)"/>
		</c:import>
		
		<x:out select="$sessionScope:doc/news/article" ></x:out>
		
		<x:out select="$doc/news/article[@id=102]"></x:out>

		<p>
			<x:forEach var="elements" select="$doc/news/article">
			 <strong><x:out select="$elements/auteur"></x:out></strong>:
			 <x:out select="$elements/titre"/>.<br/>
			
			</x:forEach>
		</p>
		
		<c:import url="test.xsl" varReader="xslFile">
			<c:import url="monDocument.xml" varReader="xmlFile">
				<x:transform doc="${xmlFile}" xslt="${xslFile}"></x:transform>
			
			</c:import>
		</c:import>
	</body>
</html>