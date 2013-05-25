module UsersHelper
  def user_avatar(user)
    if user.avatar
      link_to(image_tag(user.avatar.photo.url(:thumb)), user_photos_path(user))
    elsif user.avatar_photo_url
      link_to(image_tag( user.avatar_photo_url(:original)), user_photos_path(user))
    else
      t('.no_profile_photo')
    end
  end
end
