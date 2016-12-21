class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  validates(:name, :length => {:maximum => 15})
  before_save(:title_case)
end

private

  def title_case
    self.name=(name.titlecase())
  end
