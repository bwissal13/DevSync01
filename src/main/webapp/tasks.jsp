<%@ page import="org.example.entities.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="zxx">
<%
    List<Task> todoTasks = (List<Task>) request.getAttribute("todoTasks");
%>
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



<main class="nxl-container apps-container apps-tasks">
    <div class="nxl-content without-header nxl-full-content">
        <!-- [ Main Content ] start -->
        <div class="main-content d-flex">
            <!-- [ Content Sidebar ] start -->
            <div class="content-sidebar content-sidebar-md" data-scrollbar-target="#psScrollbarInit">
                <div class="content-sidebar-header bg-white sticky-top hstack justify-content-between">
                    <h4 class="fw-bolder mb-0">Tasks</h4>
                    <a href="javascript:void(0);" class="app-sidebar-close-trigger d-flex">
                        <i class="feather-x"></i>
                    </a>
                </div>
                <div class="content-sidebar-header">
                    <a href="javascript:void(0);" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#addNewTasks">
                        <i class="feather-plus me-2"></i>
                        <span>Add Tasks</span>
                    </a>
                </div>

            </div>
            <!-- [ Content Sidebar  ] end -->
            <!-- [ Main Area  ] start -->
            <div class="content-area" data-scrollbar-target="#psScrollbarInit">
                <div class="content-area-header sticky-top">
                    <div class="page-header-left d-flex align-items-center gap-2">
                        <a href="javascript:void(0);" class="app-sidebar-open-trigger me-2">
                            <i class="feather-align-left fs-20"></i>
                        </a>

                    </div>

                </div>
                <div class="content-area-body">
                    <!-- To-do Tasks -->
                    <div class="card stretch stretch-full">
                        <a href="javascript:void(0);" class="card-header" data-bs-toggle="collapse" data-bs-target="#tasks_collapse_1">
                            <h5 class="mb-0">To-do</h5>
                        </a>
                        <div class="card-body collapse show" id="tasks_collapse_1">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="task" items="${todoTasks}">
                                    <li class="single-task-list p-3 mb-3 border border-dashed rounded-3">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center gap-3 me-3">
                                                <div class="custom-control custom-checkbox me-2">
                                                    <!-- Custom checkbox here -->
                                                </div>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="lh-base">
                                                        <i class="feather-star"></i>
                                                    </div>
                                                    <a href="javascript:void(0);" class="single-task-list-link" data-bs-toggle="offcanvas" data-bs-target="#tasksDetailsOffcanvas">
                                                        <div class="fs-13 fw-bold text-truncate-1-line">
                                                                ${task.title}
                                                            <span class="ms-2 badge bg-soft-danger text-danger">to-do</span>
                                                        </div>
                                                        <div class="fs-12 fw-normal text-muted text-truncate-1-line">
                                                                ${task.assignedTo.username}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-shrink-0 align-items-center gap-3">
                                                <c:forEach var="tag" items="${task.tags}">
                                                    <div class="badge bg-soft-primary text-primary d-md-inline-block d-none">${tag}</div>
                                                </c:forEach>
                                                <div class="d-md-inline-block d-none me-3">
                                                        ${task.startDate} TO ${task.endDate}
                                                </div>
                                                <div class="dropdown">
                                                    <a href="javascript:void(0);" class="avatar-text avatar-md" data-bs-toggle="dropdown">
                                                        <i class="feather-more-vertical"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item edit-task" href="tasks?editTaskId=${task.id}">Edit Task</a>
                                                        <form class="dropdown-item" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="delete" />
                                                            <input type="hidden" name="taskId" value="${task.id}" />
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium text-red-600 rounded-lg">
                                                               Delete
                                                            </button>
                                                        </form>
                                                        <form class="dropdown-item" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="requestModification" />
                                                            <input type="hidden" name="taskId" value="${task.id}" />
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium text-red-600 rounded-lg">
                                                                Request Modification
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- In-Progress Tasks -->
                    <div class="card stretch stretch-full">
                        <a href="javascript:void(0);" class="card-header" data-bs-toggle="collapse" data-bs-target="#tasks_collapse_2">
                            <h5 class="mb-0">In-Progress</h5>
                        </a>
                        <div class="card-body collapse show" id="tasks_collapse_2">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="task" items="${inProgressTasks}">
                                    <li class="single-task-list p-3 mb-3 border border-dashed rounded-3">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center gap-3 me-3">
                                                <div class="custom-control custom-checkbox me-2">
                                                    <!-- Custom checkbox here -->
                                                </div>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="lh-base">
                                                        <i class="feather-star"></i>
                                                    </div>
                                                    <a href="javascript:void(0);" class="single-task-list-link" data-bs-toggle="offcanvas" data-bs-target="#tasksDetailsOffcanvas">
                                                        <div class="fs-13 fw-bold text-truncate-1-line">
                                                                ${task.title}
                                                            <span class="ms-2 badge bg-soft-danger text-danger">to-do</span>
                                                        </div>
                                                        <div class="fs-12 fw-normal text-muted text-truncate-1-line">
                                                                ${task.assignedTo.username}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-shrink-0 align-items-center gap-3">
                                                <c:forEach var="tag" items="${task.tags}">
                                                    <div class="badge bg-soft-primary text-primary d-md-inline-block d-none">${tag}</div>
                                                </c:forEach>
                                                <div class="d-md-inline-block d-none me-3">
                                                        ${task.startDate} TO ${task.endDate}
                                                </div>
                                                <div class="dropdown">
                                                    <a href="javascript:void(0);" class="avatar-text avatar-md" data-bs-toggle="dropdown">
                                                        <i class="feather-more-vertical"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item edit-task" href="tasks?editTaskId=${task.id}">Edit Task</a>
                                                        <form class="dropdown-item" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="delete" />
                                                            <input type="hidden" name="taskId" value="${task.id}" />
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium text-red-600 rounded-lg">
                                                               Delete
                                                            </button>
                                                        </form>
                                                        <form class="dropdown-item" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="requestModification" />
                                                            <input type="hidden" name="taskId" value="${task.id}" />
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium text-red-600 rounded-lg">
                                                               Request Modification
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- Done Tasks -->
                    <div class="card stretch stretch-full">
                        <a href="javascript:void(0);" class="card-header" data-bs-toggle="collapse" data-bs-target="#tasks_collapse_3">
                            <h5 class="mb-0">Done</h5>
                        </a>
                        <div class="card-body collapse show" id="tasks_collapse_3">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="task" items="${doneTasks}">
                                    <li class="single-task-list p-3 mb-3 border border-dashed rounded-3">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center gap-3 me-3">
                                                <div class="custom-control custom-checkbox me-2">
                                                    <!-- Custom checkbox here -->
                                                </div>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="lh-base">
                                                        <i class="feather-star"></i>
                                                    </div>
                                                    <a href="javascript:void(0);" class="single-task-list-link" data-bs-toggle="offcanvas" data-bs-target="#tasksDetailsOffcanvas">
                                                        <div class="fs-13 fw-bold text-truncate-1-line">
                                                                ${task.title}
                                                            <span class="ms-2 badge bg-soft-danger text-danger">to-do</span>
                                                        </div>
                                                        <div class="fs-12 fw-normal text-muted text-truncate-1-line">
                                                                ${task.assignedTo.username}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-shrink-0 align-items-center gap-3">
                                                <c:forEach var="tag" items="${task.tags}">
                                                    <div class="badge bg-soft-primary text-primary d-md-inline-block d-none">${tag}</div>
                                                </c:forEach>
                                                <div class="d-md-inline-block d-none me-3">
                                                        ${task.startDate} TO ${task.endDate}
                                                </div>
                                                <div class="dropdown">
                                                    <a href="javascript:void(0);" class="avatar-text avatar-md" data-bs-toggle="dropdown">
                                                        <i class="feather-more-vertical"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item edit-task" href="tasks?editTaskId=${task.id}">Edit Task</a>
                                                        <form class="dropdown-item" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="delete" />
                                                            <input type="hidden" name="taskId" value="${task.id}" />
                                                            Delete
                                                        </form>
                                                        <form class="dropdown-item" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="requestModification" />
                                                            <input type="hidden" name="taskId" value="${task.id}" />
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium text-red-600 rounded-lg">
                                                               Request Modification
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- Request-to-Modify tasks -->
                    <div class="card stretch stretch-full">
                        <a href="javascript:void(0);" class="card-header" data-bs-toggle="collapse" data-bs-target="#tasks_collapse_3">
                            <h5 class="mb-0">Request to Modify</h5>
                        </a>
                        <div class="card-body collapse show" id="tasks_collapse_4">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="task" items="${requestToModifyTasks}">
                                    <li class="single-task-list p-3 mb-3 border border-dashed rounded-3">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center gap-3 me-3">
                                                <div class="custom-control custom-checkbox me-2"></div>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="lh-base"><i class="feather-star"></i></div>
                                                    <a href="javascript:void(0);" class="single-task-list-link" data-bs-toggle="offcanvas" data-bs-target="#tasksDetailsOffcanvas">
                                                        <div class="fs-13 fw-bold text-truncate-1-line">
                                                                ${task.title}
                                                            <span class="ms-2 badge bg-soft-warning text-warning">request-to-modify</span>
                                                        </div>
                                                        <div class="fs-12 fw-normal text-muted text-truncate-1-line">
                                                                ${task.assignedTo.username}.
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-shrink-0 align-items-center gap-3">
                                                <c:forEach var="tag" items="${task.tags}">
                                                    <div class="badge bg-soft-primary text-primary d-md-inline-block d-none">${tag}</div>
                                                </c:forEach>
                                                <div class="d-md-inline-block d-none me-3">
                                                        ${task.startDate} TO ${task.endDate}
                                                </div>
                                                <div class="dropdown">
                                                    <a href="javascript:void(0);" class="avatar-text avatar-md" data-bs-toggle="dropdown">
                                                        <i class="feather-more-vertical"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item edit-task" href="tasks?editTaskId=${task.id}">Edit Task</a>
                                                        <form class="dropdown-item view-task" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="delete"/>
                                                            <input type="hidden" name="taskId" value="${task.id}"/>
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-red-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray" aria-label="Delete">
                                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                                                    <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                        <form class="dropdown-item view-task" action="tasks" method="post">
                                                            <input type="hidden" name="action" value="requestModification"/>
                                                            <input type="hidden" name="taskId" value="${task.id}"/>
                                                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-red-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray" aria-label="requestModification">
                                                                <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="5" height="5">
                                                                    <path d="M12,0A12,12,0,1,0,24,12,12.013,12.013,0,0,0,12,0Zm0,22A10,10,0,1,1,22,12,10.011,10.011,0,0,1,12,22Z"/>
                                                                    <path d="M12,5a1,1,0,0,0-1,1v8a1,1,0,0,0,2,0V6A1,1,0,0,0,12,5Z"/>
                                                                    <rect x="11" y="17" width="2" height="2" rx="1"/>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- [ Content Area ] end -->
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
</main>
<!--! ================================================================ !-->
<!--! [End] Main Content !-->
<!--! ================================================================ !-->
<!--! ================================================================ !-->
<!--! [Start] Add New task Modal !-->
<!--! ================================================================ !-->
<div class="modal fade" id="addNewTasks" tabindex="-1">
    <div class="modal-dialog modal-lg" role="document">
        <c:if test="${not empty errors}">
            <div class="bg-red-500 text-white p-4 rounded-lg shadow-md mb-4">
                <h3 class="font-semibold text-lg">Please fix the following errors:</h3>
                <ul class="list-disc list-inside mt-2">
                    <c:forEach var="error" items="${errors}">
                        <li class="mt-1">${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <c:if test="${empty errors}">
            <div class="text-gray-500">No errors to display.</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/tasks" method="post" class="modal-content">
            <input type="hidden" name="action"/>
            <input type="hidden" name="TaskId"/>

            <div class="modal-header">
                <h5 class="modal-title">Add New Task</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <div class="grid grid-cols-2 gap-4 mb-4">
                    <div>
                        <label for="taskName" class="form-label">Title</label>
                        <input type="text" id="taskName" class="form-control" placeholder="Task Name" name="title"/>
                    </div>
                    <div>
                        <label>Assigned To</label>
                        <select name="assignedTo" class="form-select form-control" data-select2-selector="user" multiple>
                            <c:choose>
                                <c:when test="${sessionScope.isManager}">
                                    <c:forEach var="user" items="${users}">
                                        <option value="${user.id}">${user.username}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="${sessionScope.loggedInUser.id}">${sessionScope.loggedInUser.username}</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>

                    <div>
                        <label for="start">Start Date</label>
                        <input type="date" id="start" name="startDate" value="2024-07-22" min="2024-01-01" class="form-control"/>
                    </div>

                    <div>
                        <label for="end_date">End Date</label>
                        <input type="date" id="end_date" name="end_date" value="2024-07-22" min="2024-01-01" class="form-control"/>
                    </div>

                    <div class="col-span-2">
                        <label>Tags</label>
                        <input type="text" name="tags" class="form-control"/>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Create Task</button>
            </div>
        </form>
    </div>
</div>


<!--! ================================================================ !-->
<!--! [End] Add New task Modal !-->
<!--! ================================================================ !-->
<!--! ================================================================ !-->
<!--! [Start] Tasks Details Offcanvas !-->

<!--! ================================================================ !-->
<!--! Footer Script !-->
<!--! ================================================================ !-->
<!--! BEGIN: Vendors JS !-->
<script src="assets/vendors/js/vendors.min.js"></script>
<!-- vendors.min.js {always must need to be top} -->
<script src="assets/vendors/js/select2.min.js"></script>
<script src="assets/vendors/js/select2-active.min.js"></script>
<script src="assets/vendors/js/datepicker.min.js"></script>
<script src="assets/vendors/js/quill.min.js"></script>
<!--! END: Vendors JS !-->
<!--! BEGIN: Apps Init  !-->
<script src="assets/js/common-init.min.js"></script>
<script src="assets/js/apps-tasks-init.min.js"></script>
<!--! END: Apps Init !-->
<!--! BEGIN: Theme Customizer  !-->
<script src="assets/js/theme-customizer-init.min.js"></script>
<!--! END: Theme Customizer !-->
<!--! Checklist JS !-->
<script>
    // Create a "close" button and append it to each list item
    var myNodelist = document.querySelectorAll("#checklist> li");
    var i;
    for (i = 0; i < myNodelist.length; i++) {
        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        myNodelist[i].appendChild(span);
    }

    // Click on a close button to hide the current list item
    var close = document.getElementsByClassName("close");
    var i;
    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
        };
    }

    // Add a "checked" symbol when clicking on a list item
    var list = document.getElementById("checklist");
    list.addEventListener(
        "click",
        function(ev) {
            if (ev.target.tagName === "LI") {
                ev.target.classList.toggle("checked");
            }
        },
        false
    );

    // Create a new list item when clicking on the "Add" button
    function newElement() {
        var li = document.createElement("li");
        var inputValue = document.getElementById("checklistInput").value;
        var t = document.createTextNode(inputValue);
        li.appendChild(t);
        if (inputValue === "") {
            alert("You must write something!");
        } else {
            document.getElementById("checklist").appendChild(li);
        }
        document.getElementById("checklistInput").value = "";

        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        li.appendChild(span);

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function() {
                var div = this.parentElement;
                div.style.display = "none";
            };
        }
    }
</script>
</body>


</html>