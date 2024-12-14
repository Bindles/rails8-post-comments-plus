<%= turbo_stream.append("showPostModalLabel", html: "aaa")%>
<%= turbo_stream.append("showPostModalLabel", partial: "posts/post", locals: { post: @post }) %>