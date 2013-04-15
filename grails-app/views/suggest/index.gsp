<html>
    <head>
        <title><g:message code="missingwords.title"/></title>
        <meta name="layout" content="main" />
    </head>
    <body>

		<hr />

		<h2><g:message code="missingwords.headline"/></h2>

        <p><g:message code="missingwords.copytext"/></p>

        <g:form action="findPotentiallyMissingSynonyms">
          <textarea rows="20" cols="80" name="text"></textarea>
          <br />
          <br />
          <g:submitButton name="Go" value="${message(code:'missingwords.search')}/>
        </g:form>
    </body>
</html>
