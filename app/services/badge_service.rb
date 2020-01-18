class BadgeService
  BADGE_TITLES = %w[first_try_badge all_in_category_badge certain_level_badge].freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
      send("#{badge.title}", badge)
    end
  end

  private

  def first_try_badge(_blank)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.success?
  end

  def certain_level_badge(badge)
    level = badge.rule
    return false unless @test_passage.success?
    return false unless @test.level == level.to_i
    if @user.rewarded?(badge)
      last_badge_date = UserBadge.all.where(user: @user, badge: badge).order("created_at").last.created_at

      all_tests_by_lvl = Test.all.where(level: level).count

      user_tests = @user.test_passages.joins(:test)
                               .where(passed: true)
                               .where(tests: {level: level})

      all_tests_by_lvl == user_tests.where('test_passages.created_at>?', last_badge_date).uniq.count

    else
      all_tests_by_lvl == user_tests.uniq.count
    end

  end

  def all_in_category_badge(badge)
    category = badge.rule
    category_id = Category.find_by(name: category).id
    return false unless @test_passage.success?
    return false unless @test.category == category
    if @user.rewarded?(badge)
      user_tests = @user.test_passages.joins(:test)
                                      .where(passed: true)
                                      .where(tests: {category_id: category_id})

      last_badge_date = UserBadge.all.where(user: @user, badge: badge).order("created_at").last.created_at

      Test.all_tests_by_category(category).count == user_tests.where('test_passages.created_at>?', last_badge_date).uniq.count
    else
      Test.all_tests_by_category(category).count == user_tests.uniq.count
    end
end
