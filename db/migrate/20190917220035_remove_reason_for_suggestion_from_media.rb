class RemoveReasonForSuggestionFromMedia < ActiveRecord::Migration[6.0]
  def change
    Medium.find_each do |medium|
      if medium.reason_for_suggestion.present?
        medium.suggestion_reason = medium.reason_for_suggestion
        medium.save!
      end
    end

    return if Rails.env.production? &&
      ActionText::RichText.count != Medium.where.not(reason_for_suggestion: nil).count

    remove_column :media, :reason_for_suggestion, :string
  end
end
