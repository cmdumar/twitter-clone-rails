module ApplicationHelper
  def nothing_found(arg)
    content_tag(:p, 'Nothing found!') if arg.empty?
  end

  def nav_btn
    if current_user
      edit = content_tag :li, :class => "nav-item mr-3" do
        link_to 'Edit Profile', edit_user_registration_path(current_user), class: "btn btn-sm bg-dark-blue text-white"
      end
      user = content_tag :li, :class => "nav-item mr-3" do
        link_to current_user.username, "/users/#{current_user.id}", class: "btn btn-sm bg-dark-blue text-white"
      end
      sign_out = content_tag :li, :class => "nav-item" do
        link_to 'Sign out', destroy_user_session_path, method: :delete, class: "btn btn-danger btn-sm text-white"
      end

      edit + user + sign_out
    else
      sign_up = content_tag :li, :class => "nav-item mr-2" do
        link_to 'Sign up', new_user_registration_path, class: "btn btn-sm btn-dark text-white"
      end
      sign_in = content_tag :li, :class => "nav-item" do
        link_to 'Sign in', new_user_session_path, class: "btn btn-sm btn-dark text-white"
      end

      sign_up + sign_in
    end
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

  def follow_btn(user)
    if current_user.id != user.id
      if !current_user.following?(user)
        link_to('Follow', following_index_path(user_id: user.id),
                method: :post,
                class: 'btn btn-sm btn-outline-primary rounded-pill px-3')
      else
        form_for(current_user.active_relationships.find_by(followed_id: user.id), 
                html: {method: :delete}) do |f|
                f.submit "Unfollow", class: 'btn btn-sm btn-outline-primary rounded-pill px-3'
        end
      end
    end
  end

  def margin_left_zero
    if !user_signed_in?
      "ml-0"
    end
  end

  def padding_left_zero
    if !user_signed_in?
      "pl-0"
    end
  end
end
