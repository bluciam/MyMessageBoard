<!DOCTYPE html>
<html>
<head>
  <title>Messageboard</title>
  <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
  <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
  <%= csrf_meta_tags %>
</head>
<body>
<ul class="nav nav-tabs">
  <li class="active"><a href="#">Message Board</a></li>
  <% if current_user %>
  <li><a href="#"><%= current_user.email %></a></li>
  <li><%= link_to "Log out", destroy_user_session_path, method: :destroy %></li>
  <% end %>
</ul>
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>


<p> Before yield </p>

<%= yield %>

<p> After yield </p>

</body>
</html>
