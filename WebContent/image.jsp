<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:import url="header.jsp">
	<c:param name="title" value="Picture Squirrel - View Image"></c:param>
</c:import>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" /> <%-- Don't need to declare this in web.xml only on the tomcat server! --%>

<sql:query dataSource="${ds}" sql="select * from images where id=?" var="results">
	<sql:param>${param.image}</sql:param>
</sql:query>

<c:set scope="page" var="image" value="${results.rows[0]}"></c:set>
<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}" />
<img src="${pageContext.request.contextPath}/pics/${imgname}" />

<c:import url="footer.jsp"></c:import>