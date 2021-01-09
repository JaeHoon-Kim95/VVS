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
		left: 300px;
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
		width: 300px;
		height: 100%;
		background: #222;
		position: fixed;
		top: 0;
		left: -300px;
		z-index: 1;
		transition:all .35s;
		background-color: white;
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
<ul class="sidebar-ul">
	<li class="nav-item active"><a href="#">아우터</a>
		
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     
	<li><a href="#">상의</a>
		<ul>
			<li><a href="#">02-01</a></li>
			<li><a href="#">02-02</a></li>
			<li><a href="#">02-03</a></li>
			<li><a href="#">02-04</a></li>
			<li><a href="#">02-05</a></li>
		</ul>
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     
	<li><a href="#">하의</a>
		<ul>
			<li><a href="#">03-01</a></li>
			<li><a href="#">03-02</a></li>
			<li><a href="#">03-03</a></li>
			<li><a href="#">03-04</a></li>
			<li><a href="#">03-05</a></li>
		</ul>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider my-0">
	
	<li><a href="#">악세서리</a>
		<ul>
			<li><a href="#">04-01</a></li>
			<li><a href="#">04-02</a></li>
			<li><a href="#">04-03</a></li>
			<li><a href="#">04-04</a></li>
			<li><a href="#">04-05</a></li>
		</ul>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider">
	
	<li><a href="#">신발</a>
		<ul>
			<li><a href="#">05-01</a></li>
			<li><a href="#">05-02</a></li>
			<li><a href="#">05-03</a></li>
			<li><a href="#">05-04</a></li>
			<li><a href="#">05-05</a></li>
		</ul>
	</li>
</ul>
</div>