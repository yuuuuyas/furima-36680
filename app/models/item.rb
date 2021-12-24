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
    validates :image, presence: true
    validates :item_name, presence: true
    validates :explanation, presence: true
    validates :category_id, presence: true
    validates :status_id, presence: true
    validates :delivery_caharge_id, presence: true
    validates :area_id, presence: true
    validates :price, presence: true
    
end
