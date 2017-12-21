class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         password_length: 8..64

  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    find_or_initialize_by(email: auth.info.email).tap do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    end
  end
end
