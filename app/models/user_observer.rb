class UserObserver < ActiveRecord::Observer

  def after_create(model)
    UserMailer.registration_confirmation(model).deliver
  end

end
