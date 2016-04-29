module ApplicationHelper
  
  # Returns an anchor tag with customized attributes for active links
  #
  # Example:
  #   <%= active_link_to "Main", root_path %>
  #   Returns:
  #   <a href="/" class="active">Main</a>
  #
  #   <%= active_link_to "Main", root_path, class: "bordered" %>
  #   Returns:
  #   <a href="/" class="bordered active">Main</a>
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end
end
