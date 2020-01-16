module BadgesHelper
  def rule_names
    BadgeService::BADGE_TITLES.map do |title|
      [t(".#{title}"), title]
    end
  end
end
