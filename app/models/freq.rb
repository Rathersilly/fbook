class Freq < ApplicationRecord
  belongs_to :user, inverse_of: :active_freqs
  belongs_to :friend, class_name: "User", inverse_of: :passive_freqs

  enum status: [:sent,:seen,:accepted,:denied, :cancelled]


end
