require 'pry'
class Beer < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  def self.last_added
    beers = Beer.all
    beers.order(created_at: :desc)    

  end

end
