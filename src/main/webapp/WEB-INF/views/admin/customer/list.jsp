<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="customerList" value="/admin/customer-list"/>
<c:url var="loadStaffAPI" value="/api/customer"/>
<c:url var="assignmentCustomer" value="/api/customer/assignmentCustomer"/>
<c:url var="deteleCustomer" value="/api/customer/deleteCustomer"/>

<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Quản lý khách hàng</a>
                </li>
                <li class="active">Danh sách khách hàng</li>
            </ul>
            <!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">TÌM KIẾM KHÁCH HÀNG</h4>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form modelAttribute="customerSearch" action="${customerList}" id="listForm"
                                           method="GET">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="fullname">Tên khách hàng</label>
                                                <input value="${model.fullName}" type="text" id="fullName" class="form-control"
                                                       name="fullName"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="phone">Di động</label>
                                                <input value="${model.phone}" type="number" id="phone" class="form-control" name="phone">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="email">Email</label>
                                                <input value="${model.email}" type="text" id="email" class="form-control" name="email">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label for="staffId">Chọn nhân viên phụ trách</label>
                                            <br/>
                                            <form:select path="staffId">
                                                <form:option value="-1" label="--- Chọn nhân viên phụ trách ---"/>
                                                <form:options items="${staffmaps}"/>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="pull-right">
                                                <button type="button" class="btn btn-sm btn-success" id="btnSearch">
                                                    Tìm kiếm
                                                    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-right">
                        <button id="btnDeleteBuilding" class="btn btn-white btn-warning btn-bold" data-toggle="tooltip" title="Xóa khách hàng">
                            <i class="fa fa-trash-o " aria-hidden="true"></i>
                        </button>
                        <button id="btnAddCustomer" class="btn btn-white btn-info btn-bold" data-toggle="tooltip" title="Thêm khách hàng">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
            <br>


            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                       requestURI="${customerList}" partialList="true" sort="external"
                                       size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                       id="tableList" pagesize="${model.maxPageItems}"
                                       export="false"
                                       class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                       style="margin: 3em 0 1.5em;">
                            <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                            headerClass="center select-cell">
                                <input type="checkbox" typeof="number" value="${tableList.id}"/>
                            </display:column>
                            <display:column headerClass="text-left" property="fullName" title="Tên"/>
                            <display:column headerClass="text-left" property="staffName" title="Nhân viên quản lý"/>
                            <display:column headerClass="text-left" property="phone" title="Điện thoại"/>
                            <display:column headerClass="text-left" property="email" title="email"/>
                            <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                            <display:column headerClass="text-left" property="createdBy" title="Người nhập"/>
                            <display:column headerClass="text-left" property="createdDate" title="Ngày nhập"/>
                            <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                            <display:column headerClass="col-actions" title="Thao tác">
                                    <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Giao khách hàng"
                                            onclick="assingmentCustomer(${tableList.id})">
                                        <i class=" fa fa-bars" aria-hidden="true"></i>
                                    </button>
                                    <a href="<c:url value="/admin/customer-edit-${tableList.id}"/>">
                                        <button class="btn btn-xs btn-info" title="Sửa thông tin tòa nhà">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </button>
                                    </a>
                            </display:column>
                        </display:table>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.page-content -->
    </div>
</div>

<div class="modal fade" id="assingmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Giao tòa nhà cho nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" id="staffList">
                    <thead>
                    <tr>
                        <th>Chọn nhân viên</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="customerId" name="customerId" value=""/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignBuilding">Giao khách hàng</button>
                <button type="button" class="btn btn-default" id="closeAssignBuilding" data-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>

<script>

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        $("#listForm").submit();
    })


    $('#btnAddCustomer').click(function (e) {
        var customerId = $('#customerId').val();
        window.location.href = "<c:url value='/admin/customer-edit'/>";

    })

    function assingmentCustomer(customerId) {
            openAssingmentBuildingModal();
            // truyen buildingid tham so cua ham o tren cho input co id la #buildingId
            $('#customerId').val(customerId);
            loadStaff(customerId);
    }


    function loadStaff(customerId) {
        $.ajax({
            url: '${loadStaffAPI}/' + customerId + '/staffs',
            type: 'GET',
            // data: JSON.stringify(data),
            dataType: "json",
            // contenType: "application/json",
            success: function (response) {
                if (response.data != null) {
                    var row = '';
                    $.each(response.data, function (index, item) {
                        row += '<tr>';
                        row += '<td class="text-center"><input type="checkbox" value=' + item.id + ' id="checkbox_' + item.id + '"class = check-box-element" ' + item.checked + '/></td>';
                        row += '<td class="text-center">' + item.fullName + '</td>';
                        row += '</tr>';
                    })
                }

                $('#staffList tbody').html(row);
            },
            error: function (response) {
                console.log("That bai");
            }
        });
    }


    function openAssingmentBuildingModal() {
        $('#assingmentBuildingModal').modal();
    }

    $('#btnAssignBuilding').click(function () {
        var data = {};
        data['id'] = $('#customerId').val();
        var staffList = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffIds'] = staffList;
        assignStaff(data);

    })

    function assignStaff(data) {
        $.ajax({
            url: "${assignmentCustomer}",
            type: "POST",
            //dataType: "json",
            contentType: "application/json;",
            data: JSON.stringify(data),
            success: function (response) {
                console.log(response.message);
                alert(response.message);
                window.location.href = "<c:url value='/admin/customer-list'/>";
            },
            error: function (response) {
                console.log("That bai");
            }
        });

    }

    $("#closeAssignBuilding").click(function (e) {
        e.preventDefault();
        window.location.href = "<c:url value='/admin/customer-list'/>";
    })


    $("#btnDeleteBuilding").click(function (e) {
        this.disabled = true;
        e.preventDefault();
        var data = {};
        var customerId = $('#tableList').find(' input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['id'] = customerId;
        deleteBuilding(data);
    })

    function deleteBuilding(data) {
        $.ajax({
            url: "${deteleCustomer}",
            type: "DELETE",
            // dataType: "json",
            contentType: "application/json;",
            data: JSON.stringify(data),
            success: function (response) {
                alert(response.message);
                window.location.href = "<c:url value='/admin/customer-list'/>";
                console.log(response.message);
            },
            error: function (response) {
                alert("Xóa tòa nhà thất bại!");
                console.log("That bai");

            }
        });

    }

</script>
</body>
</html>
