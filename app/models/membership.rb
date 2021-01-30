class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :shopping_list
end
