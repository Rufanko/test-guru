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

      all_tests_by_lvl == user_tests_by_level(level).where('test_passages.created_at>?', last_badge_date).uniq.count

    else
      all_tests_by_lvl == user_tests_by_level(level).uniq.count
    end

  end

  def all_in_category_badge(badge)
    category = badge.rule
    return false unless @test_passage.success?
    return false unless @test.category == category
    if @user.rewarded?(badge)
      last_badge_date = UserBadge.all.where(user: @user, badge: badge).order("created_at").last.created_at

      Test.all_tests_by_category(category).count == user_tests_by_category(category_id).where('test_passages.created_at>?', last_badge_date).uniq.count
    else
      Test.all_tests_by_category(category).count == user_tests_by_category(category_id).uniq.count
    end
  end

  private

  def user_tests_by_category(category)
    category_id = Category.find_by(name: category).id
    usertests.where(tests: {category_id: category_id})
  end

  def user_tests_by_level(level)
    usertests.where(tests: {level: level})
  end

  def usertests
    @user.test_passages.joins(:test)
                       .where(passed: true)
  end


end
