module BadgesHelper
  def rule_names
    Badge::BADGE_TITLES.each do |title|
      t(".title")
    end
  end
end
