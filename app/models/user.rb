# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_default_role
  belongs_to :role

  private

  def set_default_role
    self.role ||= Role.find_by(name: 'registered')
  end
end
