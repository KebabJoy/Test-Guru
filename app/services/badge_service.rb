class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
    @current_test = test_passage.test
  end

  def deserved_badges
    Badge.all.select do |badge|
      send("#{get_method_name(badge.rule)}?", badge.rule_value)
    end
  end


  private

  def first_try?(rule_value)
    passed_tests = TestPassage.where(test: @current_test, passed: true).count

    passed_tests == 1
  end

  def all_from_category?(rule_value)

    all_tests_ids_by_category = Test.where(category: rule_value).order(id: :asc).pluck(:id)
    passed_tests = TestPassage.where(user_id: @current_user.id).joins(:test)
                              .where(tests: { category: rule_value }, passed: true )
                              .select(:test_id).distinct.order(:test_id).pluck(:test_id)

    all_tests_ids_by_category == passed_tests
  end

  def all_of_level?(rule_value)

    all_tests_of_level = Test.where(level: rule_value.to_i).order(id: :asc).pluck(:id)
    passed_tests = TestPassage.where(user_id: @current_user.id).joins(:test)
                              .where(tests: { level: rule_value.to_i }, passed: true).select(:test_id)
                              .distinct.order(:test_id).pluck(:test_id)

    all_tests_of_level == passed_tests
  end

  def get_method_name(badge_rule)
    badge_rule.gsub(/\s+/, "_").downcase.to_sym
  end

end
