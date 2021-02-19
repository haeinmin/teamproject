<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="writer" %>


<c:if test="${(not empty authUser) and (authUser.nickname eq writer)}" >
	<jsp:doBody />
</c:if> 