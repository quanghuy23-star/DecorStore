<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>

    <div class="container-menu-desktop">

        <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop container">

                <a href="Home" class="logo">
                    <img src="images/logo-01.png" alt="IMG-LOGO">
                </a>

                <div class="menu-desktop" style="color: white;">
                    <ul class="main-menu" style="color: white; font-weight: bold; font-size: 2rem;">
                        <li class="active-menu">
                            <a href="Home" style="color: black; font-weight: bold; font-size: 1.5rem;">Home</a>
                        </li>
                        <li>
                            <a href="ProductList" style="color: black; font-weight: bold; font-size: 1.5rem;">Shop</a>
                        </li>
                        <li>
                            <a href="cart.jsp" style="color: black; font-weight: bold; font-size: 1.5rem;">Cart</a>
                        </li>
                        <c:if test="${sessionScope['account'].getRoleId() == 'AD'}">
                            <li>
                                <a href="ManageProduct" style="color: black; font-weight: bold; font-size: 1.5rem;">Manager Product</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope['account']!=null}">
                            <li>
                                <a href="MyOrder" style="color: black; font-weight: bold; font-size: 1.5rem;">My Order</a>
                            </li>
                            <li>
                                <a href="Logout" style="color: black; font-weight: bold; font-size: 1.5rem;">Logout</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope['account']==null}">
                            <li>
                                <a href="login" style="color: black; font-weight: bold; font-size: 1.5rem;">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope['account']!=null}">
                            <li>
                                <a href="contact.html" style="color: black; font-weight: bold; font-size: 1.5rem;">Hello, ${sessionScope.account.name} </a>
                            </li>
                        </c:if>                         
                    </ul>
                </div>

            </nav>
             <form action="search" method="post">
            <div>
                <input value="${txtS}" name="txt" type="text" aria-label="Search" placeholder="Search...">
                <button type="submit">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </form>

        </div>
    </div>

    <div class="wrap-header-mobile">

        <div class="logo-mobile">
            <a href="index.html"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
        </div>

        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
            </div>
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
                <i class="zmdi zmdi-shopping-cart"></i>
            </div>
            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>
            </a>
        </div>

        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
            <span class="hamburger-box">
                <span class="hamburger-inner"></span>
            </span>
        </div>
    </div>


</header>