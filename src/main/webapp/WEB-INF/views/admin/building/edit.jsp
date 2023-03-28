<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingEditURL" value="/api/building/saveBuilding"/>
<html>
<head>
    <title>Tạo tòa nhà mới</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Quản lý tòa nhà</a>
                </li>
                <li class="active">Thông tin tòa nhà</li>
            </ul>
            <!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header" style="color: #2a91d8">
                <h3>
                    THÔNG TIN TÒA NHÀ
                </h3>
            </div>
            <div class="row">
                <div class="form-group">
                    <%--<form:form class="form-horizontal" role="form" id="formEdit" commandName="model">--%>


                    <%--</form:form>--%>
                    <input hidden value="${buildigId}" id="buildingId">
                    <form:form id="formEdit" class="form-horizontal" modelAttribute="model">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 no-padding-right">
                                Tên tòa nhà
                            </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="name" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right"> Quận </label>
                            <div class="col-sm-9">
                                <form:select path="district">
                                    <form:option value="" label="--- Chọn quận ---"/>
                                    <form:options items="${districtValue}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Phường </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="ward" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Đường </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="street" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Kết cấu </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="structure" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Số tầng hầm </label>
                            <div class="col-sm-9">
                                <form:input type="number" path="numberOfBasement" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name"> Diện tích sàn </label>
                            <div class="col-sm-9">
                                <form:input type="number" path="floorArea" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Hướng </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="direction" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name"> Hạng </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="level" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Diện tích thuê </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="buildingArea" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Mô tả diện tích </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="describeArea" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Giá thuê </label>
                            <div class="col-sm-9">
                                <form:input type="number" path="rentPrice" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Mô tả giá </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="rentPriceDescription" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Phí dịch vụ</label>
                            <div class="col-sm-9">
                                <form:input type="text" path="serviceFee" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Phí ô tô </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="carFee" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Phí mô tô </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="motorBikeFee" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Phí ngoài giờ </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="overTimeFee" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Tiền điện </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="electriCityFee" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Đặt cọc </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="deposit" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Thanh toán </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="payment" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Thời hạn thuê </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="rentTime" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name"> Thời hạn trang
                                trí </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="decoraTionTime" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Tên quản lý </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="managerName" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> SĐT quản lý </label>
                            <div class="col-sm-9">
                                <form:input type="number" path="managerPhone" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Phí môi giới </label>
                            <div class="col-sm-9">
                                <form:input type="number" path="brokerageFee" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right"> Loại tòa nhà </label>
                            <div class="col-sm-9">
                                <form:checkboxes path="type" items="${buildingTypes}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="linkOfBuilding"> Link sản
                                phẩm </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="linkOfBuilding" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name"> Bản đồ </label>
                            <div class="col-sm-9">
                                <form:input type="text" path="map" cssClass=" col-sm-12"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                            <input class="col-sm-3 no-padding-right" type="file" id="uploadImage" name="image"/>
                            <div class="col-sm-9">
                                <c:if test="${not empty model.image}">
                                    <c:set var="imagePath" value="/repository${model.image}"/>
                                    <img src="${imagePath}" id="viewImage" width="300px" height="300px"
                                         style="margin-top: 50px">
                                </c:if>
                                <c:if test="${empty model.image}">
                                    <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                </c:if>
                            </div>
                        </div>

                        <!--Btn-->
                        <div class="col-sm-12">
                            <label class="col-sm-3 no-padding-right message-info"></label>

                            <input type="submit" class="btn btn-white btn-warning btn-bold"
                                   value="Thêm mới tòa nhà" id="btnAddOrUpdateBuilding"/>
                            <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">

                        </div>
                        <!--Btn-->
                    </form:form>
                </div>
            </div>
        </div>
        <!-- /.page-content -->
    </div>
</div>

<%--<script>--%>
<%--$('#btnAddBuilding').click(function() {--%>
<%--var data = {};--%>
<%--var buildingTypes = [];--%>
<%--var formData = $('#formEdit').serializeArray();--%>
<%--$.each(formData, function(index, v) {--%>
<%--if (v.name == 'type') {--%>
<%--buildingTypes.push(v.value);--%>
<%--} else {--%>
<%--data["" + v.name + ""] = v.value;--%>
<%--}--%>
<%--});--%>
<%--data['type'] = buildingTypes;--%>
<%--$.ajax({--%>
<%--type: 'POST',--%>
<%--url: '${buildingEditURL}',--%>
<%--data: JSON.stringify(data),--%>
<%--dataType: "json",--%>
<%--contenType: "application/json",--%>
<%--success: function(response) {--%>
<%--console.log("Thanh cong");--%>
<%--},--%>
<%--error: function(response) {--%>
<%--console.log("That bai");--%>
<%--}--%>
<%--});--%>
<%--})--%>

<script>

    var imageBase64 = '';
    var imageName = '';

    $("#btnAddOrUpdateBuilding").click(function (event) {
        event.preventDefault();
        var formData = $("#formEdit").serializeArray();
        var data = {};
        var buildingTypes = [];
        $.each(formData, function (i, e) {
            if (e.name == 'type') {
                buildingTypes.push(e.value);
            }
            if ('' !== e.value && null != e.value) {
                data['' + e.name + ''] = e.value;
            }

            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        var buildingId = $('#buildingId').val();
        data['type'] = buildingTypes;
        data['id'] = buildingId;
        $('#loading_image').show();
        if ($('#buildingId').val() != "" && $('#buildingId').val() != undefined) {

            $('#loading_image').show();
            updateBuilding(data);
        }
        else {
            $('#loading_image').show();
            addBuilding(data);

        }
    });

    function addBuilding(data) {
        $.ajax({
            url: '${buildingEditURL}',
            type: 'POST',
            //dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                $('#loading_image').hide();
                window.location.href = "<c:url value= '/admin/building-edit'/>";
                alert("Tạo tòa nhà thành công!");
            },
            error: function (res) {
                window.location.href = "<c:url value= '/admin/building-edit'/>";
                alert("Tạo tòa nhà thất bại !");
            }
        });
    }

    function updateBuilding(data) {
        $.ajax({
            url: '${buildingEditURL}',
            type: 'POST',
            //dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value= '/admin/building-edit-${buildigId}'/>";
                alert("Sửa tòa nhà thành công!");

            },
            error: function (res) {
                window.location.href = "<c:url value='/admin/building-edit?message=error'/>";
                alert("Giao tòa nhà thất bại !");
            }
        });
    }

    //IMAGE


    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });


    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

</script>


</body>
</html>