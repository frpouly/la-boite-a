class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :google_oauth2 ]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    if user.nil?
      user = User.create(email: data["email"], password: Devise.friendly_token[0, 20])
    end

    user
  end
end
