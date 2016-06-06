class User < ActiveRecord::Base
  has_many :authentications, dependent: :destroy
  has_many :feeds
  devise :database_authenticatable, :registerable, :recoverable,
  :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram] 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def existing_auth_providers
    ps = self.authentications.all

    if ps.size > 0
      return ps.map(&:provider)
    else
      return []
    end
  end
end