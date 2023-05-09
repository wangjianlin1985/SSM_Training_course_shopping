<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product.css" />
<div id="product_editDiv">
	<form id="productEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">课程id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_productId_edit" name="product.productId" value="<%=request.getParameter("productId") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">课程类别:</span>
			<span class="inputControl">
				<input class="textbox"  id="product_productClassObj_classId_edit" name="product.productClassObj.classId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">课程名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_productName_edit" name="product.productName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">课程图片:</span>
			<span class="inputControl">
				<img id="product_mainPhotoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="product_mainPhoto" name="product.mainPhoto"/>
				<input id="mainPhotoFile" name="mainPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">课程库存:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_productNum_edit" name="product.productNum" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">课程价格:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_price_edit" name="product.price" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">是否推荐:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_recommandFlag_edit" name="product.recommandFlag" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">是否特价:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_recipeFlag_edit" name="product.recipeFlag" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">试看视频:</span>
			<span class="inputControl">
				<a id="product_skspA" style="color:red;margin-bottom:5px;">查看</a>&nbsp;&nbsp;
    			<input type="hidden" id="product_sksp" name="product.sksp"/>
				<input id="skspFile" name="skspFile" value="重新选择文件" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">课程描述:</span>
			<span class="inputControl">
				<script id="product_productDesc_edit" name="product.productDesc" type="text/plain"   style="width:750px;height:500px;"></script>

			</span>

		</div>
		<div>
			<span class="label">发布时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="product_addTime_edit" name="product.addTime" />

			</span>

		</div>
		<div class="operation">
			<a id="productModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Product/js/product_modify.js"></script> 
