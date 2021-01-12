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
		background-color: white;
		padding-top: 70px;
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
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     
	<li><a href="#">상품 문의</a>
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     
	<li><a href="#">주문내역 조회</a>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider">
	
	<li><a href="#">회원정보</a>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider">
	
	<li><a href="#">배송 주소록 관리</a>

	</li>
</ul>
</aside>
</div>
