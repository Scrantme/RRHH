<% js = escape_javascript(
  render(
    :partial => 'candidates/list',
    :locals => { :candidates => @candidates }
  )
) %>
$("#results").html("<%= js %>");
