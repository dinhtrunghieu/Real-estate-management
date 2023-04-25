<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingEditURL" value="/admin/building-edit"/>
<c:url var="loadStaffAPI" value="/api/building"/>
<c:url var="deleteBuilding" value="/api/building/deletebuilding"/>
<c:url var="assignmentBuilding" value="/api/building/assignmentBuilding"/>

<html>
<head>
    <title>Danh sách tòa nhà</title>
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
                <li class="active">Danh sách tòa nhà</li>
            </ul>
            <!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">TÌM KIẾM TÒA NHÀ</h4>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form modelAttribute="modelSearch" action="${buildingListURL}" id="listForm"
                                           method="GET">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div>
                                                <label for="name">Tên tòa nhà</label>
                                                <input value="${model.name}" type="text" id="name"
                                                       class="form-control" name="name">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div>
                                                <label for="buildingArea">Diện tích sàn</label>
                                                <input value="${model.floorArea}" type="number" id="buildingArea"
                                                       class="form-control" name="floorArea">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <label for="district">Chọn quận hiện có</label>
                                            <br/>
                                            <form:select path="district">
                                                <form:option value="" label="--- Chọn quận ---"/>
                                                <form:options items="${districtValue}"/>
                                            </form:select>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="buildingArea">Phường</label>
                                                <input value="${model.ward}" type="text" id="ward" class="form-control"
                                                       name="ward"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="buildingArea">Đường</label>
                                                <input value="${model.street}" type="text" id="street"
                                                       class="form-control"
                                                       name="street">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="buildingArea">Số tầng hầm</label>
                                                <input value="${model.numberOfBasement}" type="number"
                                                       id="numberOfBasement" class="form-control"
                                                       name="numberOfBasement">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label>Hướng</label>
                                                <input value="${model.direction}" type="text" id="direction"
                                                       class="form-control"
                                                       name="direction"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="level">Hạng</label>
                                                <input value="${model.level}" type="text" id="level"
                                                       class="form-control"
                                                       name="level">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div>
                                                <label for="areaRentFrom">Diện tích từ</label>
                                                <input value="${model.areaRentFrom}" type="number" id="areaRentFrom"
                                                       class="form-control"
                                                       name="areaRentFrom">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div>
                                                <label for="areaRentTo">Diện tích đến</label>
                                                <input value="${model.areaRentTo}" type="number" id="areaRentTo"
                                                       class="form-control"
                                                       name="areaRentTo"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div>
                                                <label for="costRentFrom">Giá thuê từ</label>
                                                <input value="${model.costRentFrom}" type="number" id="costRentFrom"
                                                       class="form-control"
                                                       name="costRentFrom">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div>
                                                <label for="costRentTo">Giá thuê đến</label>
                                                <input value="${model.costRentTo}" type="number" id="costRentTo"
                                                       class="form-control"
                                                       name="costRentTo">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="managerName">Tên quản lí</label>
                                                <input value="${model.managerName}" type="text" id="managerName"
                                                       class="form-control"
                                                       name="managerName">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <label for="managerPhone">SĐT quản lí</label>
                                                <input value="${model.managerPhone}" type="number" id="managerPhone"
                                                       class="form-control"
                                                       name="managerPhone"/>
                                            </div>
                                        </div>
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
                                        <div class="col-sm-9">
                                            <label for="type">Chọn loại tòa nhà</label>
                                            <br>
                                            <form:checkboxes path="type" items="${buildingTypes}"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-2 ">
                                            <button type="button" class="btn btn-sm btn-success" id="btnSearch">
                                                Tìm kiếm
                                                <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                            </button>
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
                        <button id="btnDeleteBuilding" class="btn btn-white btn-warning btn-bold" data-toggle="tooltip"
                                title="Xóa tòa nhà">
                            <i class="fa fa-trash-o " aria-hidden="true"></i>
                        </button>
                        <button id="btnAddBuilding" class="btn btn-white btn-info btn-bold" data-toggle="tooltip"
                                title="Thêm tòa nhà">
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
                                       requestURI="${buildingListURL}" partialList="true" sort="external"
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
                            <display:column headerClass="text-left" property="name" title="Tên sản phẩm"/>
                            <display:column headerClass="text-left" property="addRess" title="Địa chỉ"/>
                            <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                            <display:column headerClass="text-left" property="managerPhone" title="SDT Quản lý"/>
                            <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                            <display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
                            <display:column headerClass="text-left" property="brokerageFee" title="Phí dịch môi giới"/>
                            <display:column headerClass="col-actions" title="Thao tác">
                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Giao tòa nhà"
                                        onclick="assingmentBuilding(${tableList.id})">
                                    <i class=" fa fa-bars" aria-hidden="true"></i>
                                </button>
                                <a href="<c:url value="/admin/building-edit-${tableList.id}"/>">
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
                <input type="hidden" id="buildingId" name="buildingId" value=""/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignBuilding">Giao tòa nhà</button>
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


    $('#btnAddBuilding').click(function (e) {
        window.location.href = "<c:url value='/admin/building-edit'/>";
    })

    function assingmentBuilding(buildingId) {
        openAssingmentBuildingModal();
        // truyen buildingid tham so cua ham o tren cho input co id la #buildingId
        $('#buildingId').val(buildingId);
        loadStaff(buildingId);
    }


    function loadStaff(buildingId) {
        $.ajax({
            url: '${loadStaffAPI}/' + buildingId + '/staffs',
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
        data['id'] = $('#buildingId').val();
        var staffList = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffIds'] = staffList;
        assignStaff(data);

    })

    function assignStaff(data) {
        $.ajax({
            url: "${assignmentBuilding}",
            type: "POST",
            //dataType: "json",
            contentType: "application/json;",
            data: JSON.stringify(data),
            success: function (response) {
                console.log("Thanh cong");
                alert("Giao tòa nhà thành công!");
                window.location.href = "<c:url value='/admin/building-list'/>";
            },
            error: function (response) {
                console.log("That bai");
            }
        });

    }

    $("#closeAssignBuilding").click(function (e) {
        e.preventDefault();
        window.location.href = "<c:url value='/admin/building-list'/>";
    })


    $("#btnDeleteBuilding").click(function (e) {
        this.disabled = true;
        e.preventDefault();
        var data = {};
        var idBuilding = $('#tableList').find(' input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['id'] = idBuilding;
        deleteBuilding(data);

    })

    function deleteBuilding(data) {
        $.ajax({
            url: "${deleteBuilding}",
            type: "DELETE",
            // dataType: "json",
            contentType: "application/json;",
            data: JSON.stringify(data),
            success: function (response) {
                alert("Xóa tòa nhà thành công!");
                window.location.href = "<c:url value='/admin/building-list'/>";


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
