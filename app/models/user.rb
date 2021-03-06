class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stocks
  has_many :owned_laboratories, :class_name => 'Laboratory'

  has_many :laboratory_users, dependent: :destroy
  has_many :laboratories, through: :laboratory_users

  belongs_to :current_lab, :class_name => 'Laboratory', :foreign_key => 'current_lab_id'

  validates :name, presence: true

end
