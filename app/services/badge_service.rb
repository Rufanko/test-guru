class BadgeService

  BADGE_TITLES = %i[first_try_badge all_in_category_badge certain_level_badge].freeze


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

  def first_try_badge(blank)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.success?
  end

  def certain_level_badge(level)
   if @test_passage.success? && @test.level = level
     Test.all.where(level: level).count == @user.tests.where(level: level).uniq.count
  end

  def all_in_category_badge(category)
    @test_passage.success? && (Test.all_tests_by_category(category).count == @user.count_success_tests(сategory).uniq.count)
  end

  def count_success_tests(category)
    a ||= 0
    self.test_passages.uniq.each do |x|
       if x.success? && x.test.category == category
         a += 1
       end
    end
    return a
  end


end
