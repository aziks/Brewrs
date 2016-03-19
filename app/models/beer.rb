require 'pry'
class Beer < ActiveRecord::Base
  acts_as_commentable

  belongs_to :user
  belongs_to :recipe

  validates :name, presence: true
  validates :description, presence: true

  has_attached_file :beer_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :beer_image, content_type: /\Aimage\/.*\Z/


  def self.last_added
    beers = Beer.all
    beers.order(created_at: :desc)    
  end

end
