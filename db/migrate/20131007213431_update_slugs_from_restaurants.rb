class UpdateSlugsFromRestaurants < ActiveRecord::Migration
  def change
    Restaurant.find(:all).each do |f|
      f.update_attribute :slug, f.name.parameterize
    end
  end
end
