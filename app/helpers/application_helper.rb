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

  def profile_img(img, options = {})
    if img.attached?
      image_tag(img, class: options[:class], alt: "Profile Picture")
    else
      image_tag('profile-placeholder.jpg', class: options[:class], alt: "Profile Picture")
    end
  end

  def cover_img(img, options = {})
    if img.attached?
      content_tag(:div, nil, class: options[:class], style: "background-image: url(#{url_for(img)});")
    else
      content_tag(:div, nil, class: options[:class], style: "background-image: url(https://fooddiversity.today/wp-content/uploads/2016/05/placeholder.png);")
    end
  end
end
