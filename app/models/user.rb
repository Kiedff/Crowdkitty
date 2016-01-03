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

  def paypal_url
    values = {
        :business => 'test-account@merchant.com',
        :cmd => '_cart',
        :upload => 1,
        :invoice => (rand() * 10000).to_i, #this should be id
        :currency_code => 'GBP',
        :return => "https://arcane-harbor-4252.herokuapp.com/users/#{self.id}",
        :ipn_notification_url => "https://arcane-harbor-4252.herokuapp.com/hook"
        
      }
    pledges = self.pledges
    pledges_due = []
    pledges.each do |pledge|
      pledges_due << pledge  if pledge.due
    end
    pledges_due.each_with_index do |pledge, index|
      values.merge!({
        "amount_#{index+1}" => pledge.value,
        "item_name_#{index+1}" => pledge.project.name,
        "item_number_#{index+1}" => pledge.id,
        
      })
   
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  private
  def set_default_role
    self.role = "user" unless self.role == "admin"
  end
  
end
