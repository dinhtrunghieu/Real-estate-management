<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerEditAPI" value="/api/customer/saveBuilding"/>
<c:url var="customerEditController" value="/admin/customer-edit-{id}"/>
<c:url var="getTransactionData" value="/api/customer/getData"/>
<c:url var="creatTransaction" value="/api/customer/creatTransaction"/>
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
                    <i class="menu-icon fa fas fa-users"></i>
                    <a href="#">Quản lý khách hàng</a>
                </li>
                <li class="active">Thông tin khách hàng</li>
            </ul>
            <!-- /.breadcrumb -->
        </div>


        <div class="page-content">
            <div class="page-header" style="color: #2a91d8">
                <h4>
                    THÔNG TIN KHÁCH HÀNG
                </h4>
            </div>
            <div class="row">
                <div class="form-group">
                    <input hidden value="${customerId}" id="customerId">
                    <form:form id="formEdit" class="form-horizontal" modelAttribute="model">
                        <div class="row">
                            <div class="col-xs-12">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="fullName" class="col-sm-3 no-padding-right">
                                            Tên đầy đủ
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input type="text" path="fullName" cssClass=" col-sm-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 no-padding-right"> Số điện thoại </label>
                                        <div class="col-sm-9">
                                            <form:input type="number" path="phone" cssClass=" col-sm-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 no-padding-right" for="email"> email </label>
                                        <div class="col-sm-9">
                                            <form:input type="text" path="email" cssClass=" col-sm-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 no-padding-right" for="companyName"> Tên công ty </label>
                                        <div class="col-sm-9">
                                            <form:input type="text" path="companyName" cssClass=" col-sm-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 no-padding-right" for="demand"> Nhu cầu </label>
                                        <div class="col-sm-9">
                                            <form:input type="text" path="demand" cssClass=" col-sm-12"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 no-padding-right" for="note"> Ghi chú </label>
                                        <div class="col-sm-9">
                                            <form:input type="text" path="note" cssClass=" col-sm-12"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--Btn-->
                            <div class="col-sm-12">
                                <label class="col-sm-3 no-padding-right message-info"></label>

                                <input type="submit" class="btn btn-white btn-warning btn-bold"
                                       value="ENTER" id="btnAddOrUpdateBuilding"/>
                                <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">

                            </div>
                            <!--Btn-->
                        </div>
                    </form:form>
                </div>
            </div>

            <div id="transaction">
                <c:forEach var="entry" items="${transactionCode}">
                    <div class="page-header" style="color: #2a91d8">
                        <h4 style="float: left">
                                ${entry.value}
                        </h4>
                        <button style="margin-left: 10px" id="creatTransaction"
                                class="btn btn-white btn-info btn-bold"
                                data-toggle="tooltip"
                                title="Tạo giao dịch" onclick="creatTransaction(${customerId},'${entry.key}')">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        </button>
                    </div>
                    <input type="hidden" id="transactionCode" value="${entry.key}">
                    <div class="modal-content">
                        <table style="margin-bottom: 0" class="table table-striped table-bordered table-hover ">
                            <thead>
                            <tr class="bg-success">
                                <th>Ngày tạo</th>
                                <th>Ghi chú</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="set" items="${transactionData}">
                                <c:if test="${entry.key == set.key }">
                                    <c:forEach var="item" items="${set.value}">
                                        <tr>
                                        <td>${item.createdDate}</td>
                                        <td>${item.note}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </div>
            <!-- /.page-content -->
        </div>
    </div>
</div>

<div class="modal fade" id="assingmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Tạo giao dịch</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" id="staffList">
                    <thead>
                    <tr>
                        <th>Ngày tạo</th>
                        <th>Ghi chú</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="hidden"></td>
                        <td><input class="col-sm-12" id="transactionInput"/></td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value=""/>
            </div>
            <input id="idCustomer" type="hidden" value="">
            <input id="code" type="hidden" value="">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignBuilding">Tạo giao dịch</button>
                <button type="button" class="btn btn-default" id="closeAssignBuilding" data-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>

<script>

    function creatTransaction(customerId, code) {
        $('#idCustomer').val( customerId);
        $('#code').val( code);
        openAssingmentBuildingModal();

    }

    function openAssingmentBuildingModal() {
        $('#assingmentBuildingModal').modal();
    }

    $('#btnAssignBuilding').click(function () {
        var data = {};
        data['idCustomer'] = $('#idCustomer').val();
        data['transactionCode'] = $('#code').val();
        data['note'] = $('#transactionInput').val();
        assignStaff(data);

    })

    function assignStaff(data) {
        $.ajax({
            url: "${creatTransaction}",
            type: "POST",
            //dataType: "json",
            contentType: "application/json;",
            data: JSON.stringify(data),
            success: function (response) {
                alert("Tạo thành công");
                window.location.href = "<c:url value= '/admin/customer-edit-${customerId}'/>";
            },
            error: function (response) {
                alert("Tạo thất bại");
                window.location.href = "<c:url value= '/admin/customer-edit-${customerId}'/>";
            }
        });

    }

    $("#btnAddOrUpdateBuilding").click(function (event) {
        event.preventDefault();
        var formData = $("#formEdit").serializeArray();
        var data = {};
        var customerId = $('#customerId').val();
        $.each(formData, function (i, e) {
            if ('' !== e.value && null != e.value) {
                data['' + e.name + ''] = e.value;
            }
        });
        data['id'] = customerId;
        if ($('#customerId').val() != "" && $('#customerId').val() != undefined) {
            updateCustomer(data);
        }
        else {
            addCustomer(data);
        }
    });

    function addCustomer(data) {
        $.ajax({
            url: '${customerEditAPI}',
            type: 'POST',
            //dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                res.mes
                alert("Thêm thành công");
                window.location.href = "<c:url value= '/admin/customer-edit'/>";

            },
            error: function (res) {
                alert("Thêm thất bại");
                window.location.href = "<c:url value= '/admin/customer-edit'/>";

            }
        });
    }

    function updateCustomer(data) {
        $.ajax({
            url: '${customerEditAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                alert("Cập nhật thành công");
                window.location.href = "<c:url value= '/admin/customer-edit-${customerId}'/>";
            },
            error: function (res) {
                alert("Update khách hàng thất bại !");
                window.location.href = "<c:url value='/admin/customer-edit-${customerId}'/>";

            }
        });
    }

</script>


</body>
</html>