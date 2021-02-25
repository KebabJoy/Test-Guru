module SessionsHelper
  def show_msg(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
