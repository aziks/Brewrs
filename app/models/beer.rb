require 'pry'
class Beer < ActiveRecord::Base
  acts_as_commentable
  acts_as_votable

  belongs_to :user
  belongs_to :recipe
  has_many :locations

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, uniqueness: true

  has_attached_file :beer_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :beer_image, content_type: /\Aimage\/.*\Z/

  def self.last_added
    beers = Beer.all
    beers.order(created_at: :desc)    
  end

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

end
