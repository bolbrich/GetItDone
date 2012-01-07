module UsersHelper

  def gravatar_for(user, options = { :size => 57 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.user_name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

end