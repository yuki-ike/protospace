RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    #テストスイート全体が実行される前にテストデータベースを完全に消去します。これにより、中断したテストや下手なテストコードによって生じたゴミを一掃し、テストが思わぬ振る舞いをするのを防ぎます。
    DatabaseCleaner.clean_with(:truncation)
    #データベース消去のストラテジを”transaction”に設定します。トランザクションは非常に速いので、トランザクションを実行するすべてのテスト(実際のところ、RSpecプロセスで実行されるすべてのテスト)において、この設定を行っておくのがよい
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end