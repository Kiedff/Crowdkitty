class User < ActiveRecord::Base
  mount_uploader :user_image, UserImageUploader

before_save :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable

  has_many :projects, dependent: :destroy
  has_many :pledges, dependent: :destroy
  has_many :rewards, :through => :pledges
  has_many :comments, dependent: :destroy

  validates_presence_of :name, :last_name, :email

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def pledge_payments_due
    a = Pledge.where(user_id: self.id, paid: false)
    b = a.map {|pledge| pledge.project.success_and_closed}
    b.include? true
  end

  private
  def set_default_role
    self.role = "user" unless self.role == "admin"
  end
  
end
