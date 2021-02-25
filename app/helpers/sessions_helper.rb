module SessionsHelper
  def show_msg(message)
    content_tag :p, flash[:alert], class: "flash #{message}" if flash[message]
  end
end
