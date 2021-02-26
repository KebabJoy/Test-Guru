module SessionsHelper
  def show_flash_msg(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
