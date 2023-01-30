# frozen_string_literal: true

module ArticleVisibility
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived]

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
end
