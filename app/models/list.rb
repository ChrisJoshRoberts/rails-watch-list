class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  before_destroy :delete_related_bookmarks

  def delete_related_bookmarks
    self.bookmarks.destroy_all
  end

end
