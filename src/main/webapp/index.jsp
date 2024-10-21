<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <meta name="author" content="WRAPCODERS">
    <title>DevSync</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/d.png"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" href="assets/vendors/css/daterangepicker.min.css">
    <link rel="stylesheet" href="assets/css/theme.min.css">
</head>
<body>

        <%@include file="pages/header.jsp"%>

        <main class="nxl-container">
            <div class="nxl-content">
                <div class="main-content">
                    <div class="row">
                        <div class="col-xxl-8">
                            <div class="card stretch stretch-full">
                                <div class="card-header">
                                    <h5 class="card-title">Users</h5>
                                    <div class="card-header-action">
                                        <div class="card-header-btn">
                                            <a href="javascript:void(0);" class="avatar-text avatar-xs bg-danger" title="Delete"></a>
                                            <a href="javascript:void(0);" class="avatar-text avatar-xs bg-warning" title="Refresh"></a>
                                            <a href="javascript:void(0);" class="avatar-text avatar-xs bg-success" title="Maximize/Minimize"></a>
                                        </div>
                                        <div class="dropdown">
                                            <a href="javascript:void(0);" class="avatar-text avatar-sm" data-bs-toggle="dropdown" title="Options">
                                                <i class="feather-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a href="createUser.jsp" class="dropdown-item"><i class="feather-at-sign"></i>New</a>
                                                <a href="javascript:void(0);" class="dropdown-item"><i class="feather-trash-2"></i>Deleted</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body custom-card-action p-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0">
                                            <thead>
                                            <tr class="border-b">
                                                <th scope="row">Users</th>
                                                <th>Manager</th>
                                                <th class="text-end">Actions</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="user" items="${users}">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex align-items-center gap-3">
                                                            <div class="avatar-image">
                                                                <img src="assets/images/avatar/user-avatar.png" alt="" class="img-fluid">
                                                            </div>
                                                            <a href="javascript:void(0);">
                                                                <span class="d-block">${user.username}</span>
                                                                <span class="fs-12 d-block fw-normal text-muted">${user.email}</span>
                                                            </a>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-soft-success text-success">${user.isManager}</span>
                                                    </td>
                                                    <td class="dropdown">
                                                        <a href="javascript:void(0);" class="avatar-text avatar-sm" data-bs-toggle="dropdown" title="Options">
                                                            <i class="feather-more-vertical"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-end">
                                                            <a  href="users?editUserId=${user.id}" class="dropdown-item"><i class="feather-at-sign"></i>Edit</a>
                                                            <form action="users" method="post" style="display: inline;">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <button type="submit" class="dropdown-item"><i class="feather-trash-2"></i>Delete</button>
                                                            </form>

                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <ul class="list-unstyled d-flex align-items-center gap-2 mb-0 pagination-common-style">
                                        <li><a href="javascript:void(0);"><i class="bi bi-arrow-left"></i></a></li>
                                        <li><a href="javascript:void(0);" class="active">1</a></li>
                                        <li><a href="javascript:void(0);">2</a></li>
                                        <li><a href="javascript:void(0);"><i class="bi bi-dot"></i></a></li>
                                        <li><a href="javascript:void(0);">8</a></li>
                                        <li><a href="javascript:void(0);">9</a></li>
                                        <li><a href="javascript:void(0);"><i class="bi bi-arrow-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <script src="assets/vendors/js/vendors.min.js"></script>
        <script src="assets/vendors/js/daterangepicker.min.js"></script>
        <script src="assets/vendors/js/apexcharts.min.js"></script>
        <script src="assets/vendors/js/circle-progress.min.js"></script>
        <script src="assets/js/common-init.min.js"></script>
        <script src="assets/js/dashboard-init.min.js"></script>
        <script src="assets/js/theme-customizer-init.min.js"></script>

</body>
</html>
