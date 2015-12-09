class User < ActiveRecord::Base
  before_save :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable

  has_many :projects, dependent: :destroy
  has_many :pledges, dependent: :destroy
  has_many :rewards, :through => :pledges
  has_many :comments, dependent: :destroy

  validates_presence_of :name, :last_name, :address1, :address2, :city, :postcode, :username
  validates_uniqueness_of :username

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  private
  def set_default_role
    self.role = "user"

  end
  
end
