class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
    @current_test = test_passage.test
  end

  def deserved_badges
    Badge.all.select do |badge|
      send("#{badge.rule}?", badge)
    end
  end

  private

  def first_try?(badge)
    passed_tests = TestPassage.where(user: @current_user, test: @current_test, passed: true).count

    passed_tests == 1
  end

  def all_from_category?(badge)

    all_tests_ids_by_category = Test.where(category_id: badge.rule_value.to_i).order(id: :asc).pluck(:id)
    passed_tests = TestPassage.where(user_id: @current_user.id, created_at: last_badge_date(badge.rule.to_s)..Time.current)
                              .joins(:test)
                              .where(tests: { category: badge.rule_value.to_i }, passed: true )
                              .select(:test_id)
                              .distinct
                              .order(:test_id)
                              .pluck(:test_id)

    all_tests_ids_by_category == passed_tests
  end

  def all_of_level?(badge)

    all_tests_of_level = Test.where(level: badge.rule_value.to_i).order(id: :asc).pluck(:id)
    passed_tests = TestPassage.where(user_id: @current_user.id, created_at: last_badge_date(badge.rule.to_s)..Time.current)
                              .joins(:test)
                              .where(tests: { level: badge.rule_value.to_i }, passed: true)
                              .select(:test_id)
                              .distinct.order(:test_id)
                              .pluck(:test_id)

    all_tests_of_level == passed_tests
  end

  def last_badge_date(rule)
    last_badge = UserBadge.where(user_id: @current_user.id)
                          .joins(:badge)
                          .where(badges: { rule: rule })
                          .order("created_at")
                          .last

    last_badge ? last_badge.created_at : Time.new("00-00-00")
  end
end
