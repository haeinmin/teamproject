<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${(not empty authUser) and (authUser.nickname eq '관리자')}">
	<jsp:doBody />
</c:if>
