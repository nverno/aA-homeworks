# == Schema Information
#
# Table name: routes
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Route < ApplicationRecord
  has_many :buses,
           class_name: 'Bus',
           foreign_key: :route_id,
           primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  # Create a hash with bus id's as keys and an array of bus drivers as the
  # corresponding value.
  def better_drivers_query
    buses.includes(:drivers).each_with_object({}) do |bus, h|
      h[bus.id] = bus.drivers.map(&:name)
    end
  end
end
