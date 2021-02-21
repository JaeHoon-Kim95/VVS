<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
* {padding:0;margin:0;}
	input[id="menuicon"] {
		display:none;
	}
	input[id="menuicon"] + label {
		display:block;
		width:30px;
		height: 10px;
		position: fixed;
		left:0;
		top:calc(50% - 5px);
		transition:all .35s;
		cursor: pointer;
	}
	input[id="menuicon"]:checked + label {
		z-index: 2;
		left: 200px;
	}
	input[id="menuicon"] + label span {
		display:block;
		position: absolute;
		width: 100%;
		height: 2px;
		border-radius: 30px;
		background: #000;
		transition: all .35s;
	}
	input[id="menuicon"] + label span:nth-child(1) {
		top: 0;
	}
	input[id="menuicon"] + label span:nth-child(2) {
		top: 50%;
		transform: translateY(-50%);
	}
	input[id="menuicon"] + label span:nth-child(3) {
		bottom: 0;
	}
	
	input[id="menuicon"]:checked + label span:nth-child(1) {
		top: 50%;
		transform: translateY(-50%) rotate(45deg);
	}
	input[id="menuicon"]:checked + label span:nth-child(2) {
		opacity: 0;
	}
	input[id="menuicon"]:checked + label span:nth-child(3) {
		bottom: 50%;
		transform: translateY(50%) rotate(-45deg);
	}
	
	div[class = "sidebar"] {
		width: 200px;
		height: 100%;
		background: #222;
		position: fixed;
		top: 0;
		left: -200px;
		z-index: 1;
		transition:all .35s;
		background-color: #424242;
		padding-top: 150px;
	}
	input[id="menuicon"]:checked + label + div {
		left:0;
	}
</style>

<input type="checkbox" id="menuicon">
<label for="menuicon">
	<span></span>
	<span></span>
	<span></span>
</label>


<div class="sidebar">
<aside>
<ul class="sidebar-ul">
	 
	 <li><a href="${hContext}/member/homeBack.do"><font color="white";>전체</font></a>
		
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider" color="white">
     
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=1&searchWord="><font color="white";>아우터</font></a>
		
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider" color="white">
     
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=2&searchWord="><font color="white";>상의</font></a>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=3&searchWord="><font color="white";>셔츠</font></a>
	</li>
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=4&searchWord="><font color="white";>블라우스</font></a>
	</li>
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=5&searchWord="><font color="white";>트레이닝</font></a>
	</li>
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=6&searchWord="><font color="white";>하의</font></a>
	</li>
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=7&searchWord="><font color="white";>후드</font></a>
	</li>
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
	<li><a href="/shop/product/doSearch.do?pageSize=10&pageNum=1&minPrice=0&maxPrice=0&categoryNum=8&searchWord="><font color="white";>니트</font></a>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider" color="white">
	
</ul>
</aside>
</div>
