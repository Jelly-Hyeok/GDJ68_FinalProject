<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- Toast API -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
<style type="text/css">
.wrapper-toolbar {
	padding: 0;
	border-bottom: 1px solid #d4d4d4;
	list-style: none;
}

.input-date {
	width: 60px;
	height: 10px;
}

.purchase-line-search {
	width: 200px;
	align-content: flex-end;
	height: 18.53px;
}

.purchase-line-btn {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

#purchase-input-date input {
	width: 150px;
}

.title {
	width: 120px;
	display: inline-block;
	padding: 10px 0 0 10px;
}


.material-icons{
      padding: 0px;
      height: 30px;
      width: 30px;
}
</style>


<!-- Toast API -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<div class="wrapper-toolbar">구매 입력</div>


			<div id="purchase-content">
				<span class="title">일자</span> 
				<span class="input-date"><input type="date"></span>

				<div>
					<span class="title">제목</span> <span class="input-date"><input
						name="purchaseTitle"> </span>
				</div>

				<div>
					<span class="title"></span> <span class="title">결재라인</span> <input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="" aria-label="Search">
					<button class="btn btn-info purchase-line-btn" type="submit"
						data-toggle="modal" data-target="#purchaseModal">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title">결재라인</span> <span class="title">검토자</span> <input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info purchase-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title"></span><span class="title">추가검토자</span> <input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info purchase-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title"></span><span class="title">결재자</span> <input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info purchase-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>


				<div>
					구분(결재양식) <input style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info purchase-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>


				</ul>
			</div>

			<!-- Toast UI -->
			<div id="editor"></div>


			<!-- add button -->
		<div style="float: right;">
			<button class="btn btn-info">임시저장</button>
			<button class="btn btn-info">지우기</button>
			<button class="btn btn-info">입력완료</button>
		</div>
		</div>


	</div>


	<!-- Modal -->

	<div class="modal fade" id="purchaseModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content"
				style="border-bottom: white; border-radius: 0rem;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재양식 선택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div>
					<form action="GET">
						 <input type="radio"> 이름 
						 <input type="radio"> 부서
						 <input type="search">
						 <button type="submit" class="btn btn-info material-icons">search</span>
					</form>
					</div>
                    
					<div style="display: flex; float: left; width: 40%;">
						<div style="">

							<ul id="tree" class="ztree"></ul>
						</div>

						<div style="margin-left: 20px;" id="tree_list_empty">
							<ul id="tree_list" class="ztree"></ul>

						</div>
					</div>
					<div style="float: right; width: 40%">
						<div style="float: left;">
							<button type="button" class="btn btn-info" id="tree_list_add">결재
								></button>
						</div>

						<div style="overflow: auto; float: left;" id="tree-table-div">
							<table id="tree-table">
								<tbody id="tree-table-body">
									<tr style="height: 10%">
										<td>결재</td>
										<td>이대리<br>디자인팀 이대리
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>




				</div>



			</div>
			<div class="modal-footer" style="background: white;">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-info">확인</button>
			</div>
		</div>
	</div>
	</div>
	<!-- modal end -->



	<script type="text/javascript">
		const Editor = toastui.Editor;
		const editor = new Editor({
			el : document.querySelector('#editor'),

		});
	</script>


	<!-- tree -->
	<script src="/js/ztree/paint-tree.js"></script>


</body>
</html>