class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def editor?
    self.role == 'editor'
  end

  def writer?
    self.role == 'writer' or self.role == 'editor'
  end
end
