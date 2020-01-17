class BadgeService
  BADGE_TITLES = %w[first_try_badge all_in_category_badge certain_level_badge].freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
      send("#{badge.title}", badge.rule)
    end
  end

  private

  def first_try_badge(_blank)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.success?
  end

  def certain_level_badge(level)
    return false if @user.rewarded?(@badge)

    if @test_passage.success? && @test.level = level.to_i
      Test.all.where(level: level).count == @user.tests.where(level: level).uniq.count
    end
  end

  def all_in_category_badge(category)
    return false if @user.rewarded?(@badge)
    return false unless @test_passage.success?
    return false unless Test.all_tests_by_category(category).count == @user.test_passages.joins(:test)
                                                                                .where(passed: true)
                                                                                .where('tests.category_id=?', category_id_by_name).count
    category_id = Category.find_by(name: category).id
  end
end
