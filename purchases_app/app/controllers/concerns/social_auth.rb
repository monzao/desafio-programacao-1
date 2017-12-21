module SocialAuth
 extend ActiveSupport::Concern

 def provider_callback
   user = User.from_omniauth(request.env["omniauth.auth"])

   if user.persisted?
     sign_in user
     redirect_to root_path
   else
     redirect_to new_user_registration_url
   end
 end

 def failure
   redirect_to new_user_registration_url
 end
end
