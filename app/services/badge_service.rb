class BadgeService

  attr_reader :given

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.each  do |badge|
      reward!(badge) if send("#{badge.title}", rule)
    end
  end

  def reward!(badge)
    @user.badges.push(badge)
    @given = true
  end

  private

  def first_try_badge(blank)
    @user.tests.where(id: test.id).count == 1 && @test_passage.success?
  end

  def certain_level_badge(level)
    @test_passage.success? && Test.all.where(level: level).count == @user.tests.where(level: level).uniq.count
  end

  def all_in_category_badge(category)
    @test_passage.success? && Test.all_tests_by_category.count = @user.tests.where(category: category).uniq.count
  end



end
