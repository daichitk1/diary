require "test_helper"

class DatabaseConfigurationTest < ActiveSupport::TestCase
  test "test database is separate from development database" do
    configs = ActiveRecord::Base.configurations
    test_database = configs.configs_for(env_name: "test").first.database
    development_database = configs.configs_for(env_name: "development").first.database
    assert_not_equal File.expand_path(development_database), File.expand_path(test_database)
    assert_match(/test\.sqlite3\z/, test_database)
  end
end
