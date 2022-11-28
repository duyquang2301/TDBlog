<%@page import="models.Bean.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="../../../public/css/reset.css" rel="stylesheet">
	<link href="../../../public/css/admin_home.css" rel="stylesheet">
</head>
<body>
    <div class="container" style="width: 80vw !important">
        <div class="welcome d-flex justify-content-center">
            <h1>
                <div></div>
                Hi, RonLe9519
            </h1>
        </div>
        <div class="row g-4 mt-2">
            <div class="col-sm-12 col-xl-6">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <b class="mb-0">Người đọc mới</b>
                    </div>
                    <canvas id="chart-reader"></canvas>
                </div>
            </div>
            <div class="col-sm-12 col-xl-6">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <b class="mb-0">Bài viết</b>
                    </div>
                    <canvas id="chart-post"></canvas>
                </div>
            </div>
        </div>
        <div class="bg-light p-4 mt-5 rounded">
            <table class="table table-bordered caption-top">
                <caption class="main-color position-relative">
                    <b>Danh sách bài viết</b>
                    <a class="ms-3 text-decoration-none btn-add" href="/posts/insert"> 
                        Thêm bài viết
                    </a>
                    <form class="block-search d-flex" action="/admin" method="GET">
                        <div class="d-flex">
                        	<% String sortBy = (String)request.getParameter("sortBy"); %>
                            <select id="select" name="sortBy">
                                <option value="" <% if (sortBy == null || sortBy.isEmpty()) { out.print("selected"); }%>>Sắp xếp</option>
                                <option value="name" <% if (sortBy != null && sortBy.equals("name")) { out.print("selected"); }%>>Tên bài viết</option>
                                <option value="view" <% if (sortBy != null && sortBy.equals("view")) { out.print("selected"); }%>>Lượt xem</option>
                            </select>
                            <% String state = (String)request.getParameter("state"); %>
                            <select id="select" class="ms-3" name="state">
                                <option value="-1" <% if (state == null || state.isEmpty()) { out.print("selected"); }%>>Trạng thái</option>
                                <option value="0" <% if (state != null && state.equals("0")) { out.print("selected"); }%>>Đang chờ duyệt</option>
                                <option value="1" <% if (state != null && state.equals("1")) { out.print("selected"); } %>>Đang phát hành</option>
                                <option value="2" <% if (state != null && state.equals("2")) { out.print("selected"); } %>>Đã cấm</option>
                            </select>
                        </div>
                        <% String keyword = request.getParameter("keyword") == null ? "" : (String)request.getParameter("keyword"); %>
                        <input placeholder="Nhập từ khóa tìm kiếm" class="ms-3 p-2" value="<%= keyword %>" name="keyword"/>
                        <button class="ms-2 btn btn-primary">Tìm kiếm</button>
                    </form>
                </caption>
                <thead class="table-white">
                  <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã bài viết</th>
                    <th scope="col">Tên bài viết</th>
                    <th scope="col">Thể loại</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Tác giả</th>
                    <th scope="col">Lượt xem</th>
                    <th scope="col">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                	<% 
                		ArrayList<Post> posts = (ArrayList<Post>)request.getAttribute("posts");
                		for (int i = 0;i < posts.size();i++) {
                	%>
                		<tr>
		                    <th scope="row"><%= i + 1 %></th>
		                    <td><%= posts.get(i).getID() %></td>
		                    <td><%= posts.get(i).getName() %></td>
		                    <td><%= posts.get(i).getTag() %></td>
		                    <td><%= posts.get(i).getState() %></td>
		                    <td><%= posts.get(i).getAuthor() %></td>
		                    <td><%= posts.get(i).getViewCount() %></td>
		                    <td class="d-flex justify-content-between">
		                        <a href="" class="text-decoration-none main-color">Xem</a>
		                        <a href="" class="text-decoration-none main-color">Sửa</a>
		                        <a href="" class="text-decoration-none main-color">Xóa</a>
		                    </td>
		                  </tr>
                	<%  } %>
                </tbody>
              </table>
              <nav class="d-flex justify-content-center">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link main-color" href="#">Previous</a></li>
                  <li class="page-item"><a class="page-link main-color" href="#">1</a></li>
                  <li class="page-item"><a class="page-link main-color" href="#">2</a></li>
                  <li class="page-item"><a class="page-link main-color" href="#">3</a></li>
                  <li class="page-item"><a class="page-link main-color" href="#">Next</a></li>
                </ul>
              </nav>
        </div>
    </div>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha512-NqYds8su6jivy1/WLoW8x1tZMRD7/1ZfhWG/jcRQLOzV1k1rIODCpMgoBnar5QXshKJGV7vi0LXLNXPoFsM5Zg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="../../../public/js/admin_home.js"></script>
</body>
</html>