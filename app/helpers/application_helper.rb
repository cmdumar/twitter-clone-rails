module ApplicationHelper
  def nothing_found(arg)
    content_tag(:p, 'Nothing found!') if arg.empty?
  end

  def show_flash(options = {})
    output = ActiveSupport::SafeBuffer.new

    %i[alert notice].each do |message|
      if flash[message].present?
        output << content_tag(:p, class: [message, options[:class]], tabindex: '0') do
          flash[message]
        end
      end
      flash[message] = nil
    end

    output
  end

  def profile_img(img, options = {})
    if img.attached?
      image_tag(img, class: options[:class], alt: 'Profile Picture')
    else
      image_tag('profile-placeholder.jpg', class: options[:class], alt: 'Profile Picture')
    end
  end

  def cover_img(img, options = {})
    if img.attached?
      content_tag(:div, nil, class: options[:class], style: "background-image: url(#{url_for(img)});")
    else
      content_tag(:div, nil, class: options[:class], style: 'background-image: url(https://fooddiversity.today/wp-content/uploads/2016/05/placeholder.png);')
    end
  end

  def sidebar
    render partial: 'shared/sidebar' if user_signed_in?
  end

  def username(current_user)
    content_tag(:h1, current_user.username) if current_user
  end
end
