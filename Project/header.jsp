<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header class="site-header">
 <a class="brand" href="${pageContext.request.contextPath}/"><span class="brand-mark">S</span> ShopSphere<span class="brand-dot">.</span></a>
 <nav class="main-nav"><a href="${pageContext.request.contextPath}/">Home</a><a href="${pageContext.request.contextPath}/products">Shop</a><a href="${pageContext.request.contextPath}/products?category=Audio">Audio</a><a href="${pageContext.request.contextPath}/products?category=Lifestyle">Lifestyle</a></nav>
 <form class="nav-search" action="${pageContext.request.contextPath}/products"><span>⌕</span><input name="q" placeholder="Search products..." value="${param.q}"></form>
 <a class="bag-link" href="${pageContext.request.contextPath}/cart">Bag <span class="bag-count"><c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.size()}"/></span></a>
</header>
<c:if test="${not empty sessionScope.notice}"><div class="flash success"><c:out value="${sessionScope.notice}"/><a href="${pageContext.request.contextPath}/products"> Continue shopping →</a></div><c:remove var="notice" scope="session"/></c:if>
<c:if test="${not empty sessionScope.error}"><div class="flash error"><c:out value="${sessionScope.error}"/></div><c:remove var="error" scope="session"/></c:if>
