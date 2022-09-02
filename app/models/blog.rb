class Blog < ApplicationRecord
	 extend FriendlyId
	belongs_to :user
	belongs_to :category
	has_rich_text :body
	has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_one_attached :image
	 has_one_attached :pictures

	has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user

    friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

end
