class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
    @current_test = test_passage.test
  end

  def deserved_badges
    Badge.all.select do |badge|
      send("#{badge.rule}?")
    end
  end


  private

  def first_try?
    passed_tests = TestPassage.where(test: @current_test, passed: true).count

    passed_tests == 1
  end

  def all_from_category?
    test_category = @current_test.category

    all_tests_ids_by_category = Test.where(category: test_category).order(id: :asc).pluck(:id)
    passed_tests = TestPassage.where(user_id: @current_user.id).joins(:test)
                              .where(tests: { category: test_category }, passed: true )
                              .select(:test_id).distinct.order(:test_id).pluck(:test_id)

    all_tests_ids_by_category == passed_tests
  end

  def all_of_level?
    all_tests_of_level = Test.where(level: @current_test.level).order(id: :asc).pluck(:id)
    passed_tests = TestPassage.where(user_id: @current_user.id).joins(:test)
                              .where(tests: { level: @current_test.level }, passed: true).select(:test_id)
                              .distinct.order(:test_id).pluck(:test_id)

    all_tests_of_level == passed_tests
  end

end
