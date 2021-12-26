class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge
    belongs_to :area
    belongs_to :delivery_date

    validates :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_date_id, numericality: { other_than: 1 }
    validates :image, presence: true
    validates :item_name, presence: true
    validates :explanation, presence: true
    validates :category_id, presence: true
    validates :status_id, presence: true
    validates :delivery_charge_id, presence: true
    validates :area_id, presence: true
    validates :delivery_date_id, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

end
