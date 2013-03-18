class User < ActiveRecord::Base

  devise :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :remember_me, :provider, :uid

  # attr_accessible :title, :body
  has_many :jobs
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
    end
  end

end
