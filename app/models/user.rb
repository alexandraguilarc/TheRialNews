# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  phone                  :string
#  name                   :string
#  age                    :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Validaciones
  validates :name,  allow_blank: true,
                    length: { minimum: 3, maximum: 25 }
  validates :phone, allow_blank: true,
                    length: { minimum: 10, maximum: 15 }
  validates :age,    allow_blank: true,
                    length: { maximum: 2 }

  #Associations
  has_many :articles, dependent: :destroy
  has_many :comments
  

  #Método condicional que indica que si nombre está vacío usa email
  def full_name
    name.blank?? email: name
  end

  enum :role, [:normal_user, :author, :admin]

end
