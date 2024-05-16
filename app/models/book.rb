class Book < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user

end

  # validates :title, presence: true

  # validates :body,
  # length: {minimum: 1, maximun: 200 }, on: :create

