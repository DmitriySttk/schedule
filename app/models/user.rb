class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    user ||= User.create(
        email: data["email"],
        password: Devise.friendly_token[0, 20]
    )

    user.name = access_token.info.name

    user.provider = access_token.provider
    user.uid = access_token.uid
    user.save

    user
  end
end
