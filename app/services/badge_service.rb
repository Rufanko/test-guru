class BadgeService

  BADGE_TITLES = %i[first_try_badge all_in_category_badge certain_level_badge].freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
      @badge = badge
      send("#{badge.title}", badge.rule)
    end
  end



  private

  def first_try_badge(blank)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.success?
  end

  def certain_level_badge(level)
   return false  if @user.rewarded?(@badge)
   if @test_passage.success? && @test.level = level.to_i
     Test.all.where(level: level).count == @user.tests.where(level: level).uniq.count
   end
  end

  def all_in_category_badge(category)
    return false  if @user.rewarded?(@badge)
    category_id_by_name = Category.find_by(name: category).id
    @test_passage.success? && Test.all_tests_by_category(category).count == @user.test_passages.where(passed: true)
                                                                                               .joins(:test)
                                                                                               .where('tests.category_id=?', category_id_by_name)
  end


end
