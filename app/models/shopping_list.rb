class ShoppingList < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_many :shopping_list_items, dependent: :destroy

  has_many :memberships, dependent: :destroy
  has_many :joined_members, :through => :memberships, source: :user, dependent: :destroy

  validates :title, presence: true

  before_create :set_random_key

  after_update_commit { broadcast_replace_to "shopping_lists" }

  def generate_random_key
    self.random_key = Time.now.to_i
  end

  private

  def set_random_key
    random_key = self.creator.username.to_s + generate_random_key.to_s.last(6)
    if self.creator.shopping_lists.find_by_random_key(random_key)
      set_random_key
    else
      self[:random_key] = random_key
    end
  end
end
