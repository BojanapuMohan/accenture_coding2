class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  
  validates :name, :presence => true
  validates :role, :presence => true

  def ceo?
    self.role == "ceo"
  end

  def employee?
    self.role != "ceo"
  end
end
