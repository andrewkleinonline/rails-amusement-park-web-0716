class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if has_enough_tickets? && is_tall_enough?
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      # binding.pry
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    elsif is_tall_enough?
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif has_enough_tickets?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  private

  def has_enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def is_tall_enough?
    self.user.height >= self.attraction.min_height
  end

end
