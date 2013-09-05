class RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    home_path
  end


end