class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 include SocialAuth

 %w[facebook].each do |method|
   define_method(method) do
     provider_callback
   end
 end
end
