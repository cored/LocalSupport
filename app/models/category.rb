require 'csv'

class Category < ActiveRecord::Base
  has_and_belongs_to_many :organizations

  def self.seed(csv_file)
    CategorySeeder.seed(Category, csv_file)
  end

  def self.html_drop_down_options
    self.where('charity_commission_id < 199').order('name ASC').collect {|category| [ category.name, category.id ] }
  end

  def self.create_category_from_csv(name, charity_commission_id, charity_commission_name)
    create!(name:name, 
            charity_commission_id:charity_commission_id, 
            charity_commission_name:charity_commission_name)
  end
end
