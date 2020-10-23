module ApplicationHelper
  def nothingFound(arg)
    if arg.empty?
      content_tag(:p, "Nothing found!")
    end
  end

  def show_flash(options = {})
    output = ActiveSupport::SafeBuffer.new

    [:alert, :notice].each do |message|
      output << content_tag(:p, class: [message, options[:class]], tabindex: '0') do
          flash[message]
      end if flash[message].present?
      flash[message] = nil
    end

    output
  end
end
