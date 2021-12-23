class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_caharge
    belongs_to :area
    belongs_to :delivery_date

    validates :category_id, :status_id, :delivery_caharge_id, :area_id, :delivery_date, numericality: { other_than: 1 }
end
