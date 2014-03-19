class CategorySeeder 

  def self.seed(category_repo, csv_file)
    new(category_repo, csv_file).seed
  end

  def initialize(category_repo, csv_file)
    @column_mappings = {
      cc_id: 'CharityCommissionID',
      cc_name: 'CharityCommissionName',
      name: 'Name'
    }
    @category_repo = category_repo
    @csv_text = File.open(csv_file, 'r:ISO-8859-1')
  end

  def seed
    CategoryCSVFile.parse(csv_text) do |row|
      category_repo.create_category_from_csv(
        row[column_mappings[:name]].strip, 
        row[column_mappings[:cc_id]], 
        row[column_mappings[:cc_name]].strip)
    end
  end

  private 
  attr_reader :column_mappings, :csv_text, :category_repo
end

class CategoryCSVFile

  def self.parse(csv_text, &block) 
    CSV.parse(csv_text, :headers => true).each(&block)
  end

end
